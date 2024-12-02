const {savePhoto} = require('../util/photo/photo.util');
const daoManager = require('../dao/manager.dao');
const UserService = require('../service/user.service');
const PostService = require('../service/post.service');
const userService = new UserService(daoManager.userDAO);
const postService = new PostService(daoManager.postDAO);
const {body, validationResult} = require("express-validator");
const bcrypt = require("bcrypt");

class UserController {
    async uploadAvatar(req, res) {
        try {
            let photo;

            if (req.files && req.files.photo) {
                photo = req.files.photo;
            } else if (req.body && req.headers['content-type'].startsWith('image/')) {
                photo = {
                    name: `photo.${req.headers['content-type'].split('/')[1]}`,
                    data: req.body,
                };
            } else {
                return res.status(400).json({
                    message: 'No photo uploaded'
                });
            }

            const server_filename = await savePhoto(photo, 'avatars');
            return res.status(200).json({
                message: 'Photo uploaded successfully',
                server_filename
            });

        } catch (error) {
            console.error('Error in uploadAvatar:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getAllUsers(req, res) {
        try {
            const page = parseInt(req.query.page) || 1;
            const limit = 30;
            const offset = (page - 1) * limit;
            const orderBy = req.query.sortBy == 'rating' ? 'rating' : 'login';
            const order = req.query.sortBy == 'rating' ? 'DESC' : 'ASC';

            const {users, total} = await userService.getAllUsers({limit, offset, orderBy, order});
            return res.status(200).json({
                message: 'Users retrieved successfully',
                data: users,
                total: total
            });
        } catch (error) {
            console.error('Error in getAllUsers:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getFavoritePosts(req, res) {
        try {
            const userId = req.params.user_id;
            const authenticatedUserId = req.user.id;

            if (userId != authenticatedUserId) {
                return res.status(403).json({
                    message: 'Forbidden: Access denied'
                });
            }

            const {page = 1, limit = 30, status, sortBy, title, category_ids, startDate, endDate} = req.query;
            const offset = (page - 1) * limit;

            const conditions = {};
            if (status) {
                conditions.status = status;
            }

            if (title) {
                conditions.title = `%${title}%`;
            }

            const options = {
                limit,
                offset,
                conditions,
                orderBy: sortBy == 'created_at' ? 'created_at' : undefined,
                order: sortBy == 'created_at' ? 'DESC' : undefined,
                category_ids,
                startDate,
                endDate
            };

            const {posts, found, total} = await postService.getFavoritePosts(userId, options);
            return res.status(200).json({
                message: 'Favorite posts retrieved successfully',
                data: posts,
                found,
                total
            });
        } catch (error) {
            console.error('Error in getFavoritePosts:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getUserById(req, res) {
        try {
            const userId = req.params.user_id;
            const user = await userService.getUserById(userId);
            if (!user) {
                return res.status(404).json({
                    message: 'User not found'
                });
            }
            return res.status(200).json({
                message: 'User retrieved successfully',
                data: {
                    ...user,
                    profile_picture_url: `${process.env.BASE_URL}/uploads/avatars/${user.profile_picture_name}`
                }
            });
        } catch (error) {
            console.error('Error in getUserById:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createUser(req, res) {
        await body('login')
            .isLength({min: 3, max: 30})
            .matches(/^[a-zA-Z0-9_]{3,30}$/)
            .withMessage('Login must be 3-30 characters long and contain only letters, numbers, and underscores.')
            .run(req);
        await body('email')
            .isEmail()
            .withMessage('Invalid email address.')
            .run(req);
        await body('full_name')
            .isLength({min: 3})
            .withMessage('Full name is required.')
            .run(req);

        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(422).json({
                    success: false,
                    message: 'Validation error',
                    errors: errors.array()
                });
            }

            const {login, password, email, full_name} = req.body;
            const existingUserByEmail = await userService.findByEmail(email);
            if (existingUserByEmail) {
                return res.status(409).json({
                    success: false,
                    message: 'Email already in use'
                });
            }

            const existingUserByLogin = await userService.findByLogin(login);
            if (existingUserByLogin) {
                return res.status(409).json({
                    success: false,
                    message: 'Login already in use'
                });
            }

            const hashedPassword = await bcrypt.hash(password, 10);

            const newUser = await userService.createUser({
                login,
                password: hashedPassword,
                email,
                full_name
            });

            return res.status(201).json({
                success: true,
                message: 'User created successfully',
                data: {
                    ...newUser,
                    profile_picture_url: `${process.env.SERVER_URL}/uploads/avatars/${newUser.profile_picture_name}`
                }
            });

        } catch (error) {
            console.error('Error in createUser:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }


    async updateUser(req, res) {
        try {
            const userId = req.params.user_id;
            const {full_name, profile_picture_name, old_password, new_password, role} = req.body;

            if (old_password && new_password) {
                const password = await userService.getPasswordById(userId);
                if (!password) {
                    return res.status(404).json({
                        message: 'User not found'
                    });
                }

                const passwordMatch = await bcrypt.compare(old_password, password);
                if (!passwordMatch) {
                    return res.status(401).json({
                        message: 'Invalid password'
                    });
                }

                const hashedPassword = await bcrypt.hash(new_password, 10);
                const updatedUser = await userService.updateUser(userId, {password: hashedPassword});
                return res.status(200).json({
                    message: 'User updated successfully',
                    data: {
                        ...updatedUser,
                        profile_picture_url: `${process.env.BASE_URL}/uploads/avatars/${updatedUser.profile_picture_name}`
                    }
                });
            }

            let updateData = {};
            if (full_name) updateData.full_name = full_name;
            if (profile_picture_name) updateData.profile_picture_name = profile_picture_name;

            if (req.user.role == 'admin' && userId != req.user.id) {
                updateData = {};
            }

            if (req.user.role == 'admin' && role) {
                updateData.role = 'admin';
            }

            const updatedUser = await userService.updateUser(userId, updateData);
            if (!updatedUser) {
                return res.status(404).json({
                    message: 'User not found'
                });
            }
            return res.status(200).json({
                message: 'User updated successfully',
                data: {
                    ...updatedUser,
                    profile_picture_url: `${process.env.BASE_URL}/uploads/avatars/${updatedUser.profile_picture_name}`
                }
            });
        } catch (error) {
            console.error('Error in updateUser:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async deleteUser(req, res) {
        try {
            const userId = req.params.user_id;
            const deleted = await userService.deleteUser(userId);
            if (!deleted) {
                return res.status(404).json({
                    message: 'User not found'
                });
            }
            return res.status(200).json({
                message: 'User deleted successfully'
            });
        } catch (error) {
            console.error('Error in deleteUser:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getUserPosts(req, res) {
        try {
            const {page = 1, limit = 30, status, sortBy, title, category_ids, startDate, endDate} = req.query;
            const userId = req.params.user_id;
            const offset = (page - 1) * limit;

            const conditions = {user_id: userId};
            if (status) {
                conditions.status = status;
            }

            if (title) {
                conditions.title = `%${title}%`;
            }

            const options = {
                limit,
                offset,
                conditions,
                orderBy: sortBy == 'created_at' ? 'created_at' : undefined,
                order: sortBy == 'created_at' ? 'DESC' : undefined,
                category_ids,
                startDate,
                endDate
            };

            const {posts, found, total} = await postService.getAllPosts(options);
            return res.status(200).json({
                message: 'Posts retrieved successfully',
                data: posts,
                found,
                total
            });
        } catch (error) {
            console.error('Error in getUserPosts:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async addFavoritePost(req, res) {
        try {
            const userId = req.user.id;
            const {postId} = req.body;

            await postService.addFavoritePost(userId, postId);
            return res.status(200).json({
                message: 'Post added to favorites successfully'
            });
        } catch (error) {
            console.error('Error in addFavoritePost:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async removeFavoritePost(req, res) {
        try {
            const userId = req.user.id;
            const postId = req.params.post_id;

            await postService.removeFavoritePost(userId, postId);
            return res.status(200).json({
                message: 'Post removed from favorites successfully'
            });
        } catch (error) {
            console.error('Error in removeFavoritePost:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }
}


module.exports = new UserController();