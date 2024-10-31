const express = require('express');
const userController = require('../controllers/user.controller');
const authMiddleware = require('../middleware/auth.middleware.js');
const roleMiddleware = require('../middleware/role.middleware.js');
const accessControlMiddleware = require('../middleware/access.control.middleware');
const {canModifyUser, canDeleteUser, checkUserPosts} = require('../middleware/access.rules');


const router = express.Router();

router.get('/users', userController.getAllUsers);
router.get('/users/:user_id', userController.getUserById);
router.get('/users/:user_id/posts', checkUserPosts, userController.getUserPosts);
router.get('/users/:user_id/favorite-posts', authMiddleware, userController.getFavoritePosts);
router.post('/users/favorite-posts', authMiddleware, userController.addFavoritePost);
router.delete('/users/favorite-posts/:post_id', authMiddleware, userController.removeFavoritePost);
router.patch('/users/:user_id', authMiddleware, accessControlMiddleware(canModifyUser), userController.updateUser);
router.delete('/users/:user_id', authMiddleware, accessControlMiddleware(canDeleteUser), userController.deleteUser);
router.post('/users/upload-avatar', authMiddleware, userController.uploadAvatar);
router.post('/users', authMiddleware, roleMiddleware(['admin']), userController.createUser);

module.exports = router;