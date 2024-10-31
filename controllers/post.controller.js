const {savePhoto} = require('../util/photo/photo.util');
const PostService = require('../service/post.service');
const daoManager = require("../dao/manager.dao");
const {body, validationResult} = require('express-validator');

const postService = new PostService(daoManager.postDAO);

class PostController {
    async getAllPosts(req, res) {
        try {
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

            const posts = await postService.getAllPosts(options);
            return res.status(200).json({
                message: 'Posts retrieved successfully',
                data: posts
            });
        } catch (error) {
            console.error('Error in getAllPosts:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async uploadPostMedia(req, res) {
        try {
            let files = [];
            let savedFiles = [];

            if (req.files && req.files.media) {
                files = Array.isArray(req.files.media) ? req.files.media : [req.files.media];
            }

            else if (req.body && (req.headers['content-type'].startsWith('image/') || req.headers['content-type'] === 'application/pdf')) {
                files.push({
                    name: `file.${req.headers['content-type'].split('/')[1]}`,
                    data: req.body,
                    mimetype: req.headers['content-type']
                });
            }

            if (files.length === 0) {
                return res.status(400).json({
                    message: 'No files uploaded'
                });
            }

            for (const file of files) {
                const subDir = 'posts';
                const server_filename = await savePhoto(file, subDir);
                savedFiles.push({
                    originalName: file.name,
                    server_filename
                });
            }

            return res.status(200).json({
                message: 'Files uploaded successfully',
                savedFiles
            });

        } catch (error) {
            console.error('Error in uploadPostMedia:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createPost(req, res) {
        await body('title')
            .isLength({min: 3, max: 100})
            .withMessage('Title must be 3-100 characters long.')
            .run(req);
        await body('content')
            .isLength({min: 10})
            .withMessage('Content must be at least 10 characters long.')
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

            const {title, content, category_ids, files} = req.body;
            const userId = req.user.id;

            const newPost = await postService.createPost({
                user_id: userId,
                title,
                content,
                category_ids,
                files
            });

            return res.status(201).json({
                success: true,
                message: 'Post created successfully',
                data: newPost
            });

        } catch (error) {
            console.error('Error in createPost:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getPostById(req, res) {
        try {
            const postId = req.params.post_id;
            const post = await postService.getPostById(postId);
            if (!post) {
                return res.status(404).json({
                    message: 'Post not found'
                });
            }
            return res.status(200).json({
                message: 'Post retrieved successfully',
                data: post
            });
        } catch (error) {
            console.error('Error in getPostById:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getCategoriesByPostId(req, res) {
        try {
            const postId = req.params.post_id;
            const categories = await postService.getCategoriesByPostId(postId);
            if (!categories) {
                return res.status(404).json({
                    message: 'Categories not found'
                });
            }
            return res.status(200).json({
                message: 'Categories retrieved successfully',
                data: categories
            });
        } catch (error) {
            console.error('Error in getCategoriesByPostId:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getFileNamesByPostId(req, res) {
        try {
            const postId = req.params.post_id;
            const fileNames = await postService.getFileNamesByPostId(postId);
            if (!fileNames) {
                return res.status(404).json({
                    message: 'Files not found'
                });
            }
            return res.status(200).json({
                message: 'Files retrieved successfully',
                data: fileNames
            });
        } catch (error) {
            console.error('Error in getFileNamesByPostId:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getLikesByPostId(req, res) {
        try {
            const postId = req.params.post_id;
            const likesData = await postService.getLikesByPostId(postId);
            return res.status(200).json({
                message: 'Likes and dislikes retrieved successfully',
                data: likesData
            });
        } catch (error) {
            console.error('Error in getLikesByPostId:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createLike(req, res) {
        try {
            const userId = req.user.id;
            const postId = req.params.post_id;
            const {isLike} = req.body;

            const post = await postService.getPostById(postId);
            if (post.user_id == userId) {
                return res.status(403).json({message: 'You cannot like your own post'});
            }

            if (typeof isLike === 'undefined') {
                return res.status(400).json({message: 'Bad Request: isLike is required'});
            }
            let type;

            if (isLike === 'true') {
                type = 'like';
            } else {
                type = 'dislike';
            }

            await postService.addLike(userId, postId, type);

            return res.status(200).json({message: 'Like/dislike added successfully'});
        } catch (error) {
            console.error('Error in createLike:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async deleteLike(req, res) {
        try {
            const userId = req.user.id;
            const postId = req.params.post_id;

            const post = await postService.getPostById(postId);
            if (post.user_id == userId) {
                return res.status(403).json({message: 'You cannot like your own post'});
            }

            await postService.removeLike(userId, postId);

            return res.status(200).json({message: 'Like removed successfully'});
        } catch (error) {
            console.error('Error in deleteLike:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async getLikeStatus(req, res) {
        try {
            const userId = req.user.id;
            const postId = req.params.post_id;

            const likeStatus = await postService.getLikeStatus(userId, postId);

            return res.status(200).json({
                message: 'Like status retrieved successfully',
                data: likeStatus
            });
        } catch (error) {
            console.error('Error in getLikeStatus:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async deletePost(req, res) {
        try {
            const postId = req.params.post_id;
            await postService.deletePost(postId);
            return res.status(200).json({message: 'Post deleted successfully'});
        } catch (error) {
            console.error('Error in deletePost:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async updatePost(req, res) {
        await body('title')
            .optional()
            .isLength({min: 3, max: 100})
            .withMessage('Title must be 3-100 characters long.')
            .run(req);
        await body('content')
            .optional()
            .isLength({min: 10})
            .withMessage('Content must be at least 10 characters long.')
            .run(req);
        await body('status')
            .optional()
            .isIn(['active', 'inactive'])
            .withMessage('Status must be either active or inactive.')
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

            const postId = req.params.post_id;
            const {title, content, status, category_ids, files} = req.body;

            const post = await postService.getPostById(postId);
            let updateData = {title, content, category_ids, files};
            if (req.user.role === 'admin' && post.user_id !== req.user.id) {
                updateData = {};
            }

            if (req.user.role === 'admin' && status) {
                updateData.status = status;
            }

            if (req.user.role === 'user' && status == 'inactive') {
                updateData.status = status;
            }

            const updatedPost = await postService.updatePost(postId, updateData);
            if (!updatedPost) {
                return res.status(404).json({message: 'Post not found'});
            }

            return res.status(200).json({
                success: true,
                message: 'Post updated successfully',
                data: updatedPost
            });

        } catch (error) {
            console.error('Error in updatePost:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getCommentsByPostId(req, res) {
        try {
            const postId = req.params.post_id;
            const userId = req.user ? req.user.id : null;

            const comments = await postService.getCommentsByPostId(postId, userId);
            return res.status(200).json({
                message: 'Comments retrieved successfully',
                data: comments
            });
        } catch (error) {
            console.error('Error in getCommentsByPostId:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createComment(req, res) {
        await body('content')
            .isLength({min: 1})
            .withMessage('Content must be at least 1 character long.')
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

            const { content, parent_comment_id } = req.body;
            const userId = req.user.id;
            const postId = req.params.post_id;

            const newComment = await postService.createComment({
                user_id: userId,
                post_id: postId,
                content,
                parent_comment_id: parent_comment_id || null
            });

            return res.status(201).json({
                success: true,
                message: 'Comment created successfully',
                data: newComment
            });

        } catch (error) {
            console.error('Error in createComment:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }
}

module.exports = new PostController();
