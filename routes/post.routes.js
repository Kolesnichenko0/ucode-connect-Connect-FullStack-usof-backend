const express = require('express');
const postController = require('../controllers/post.controller');
const authMiddleware = require('../middleware/auth.middleware');
const {
    checkUser,
    checkUserStatus,
    checkPostOwnership,
    checkPostOwnershipWithoutAdmin,
    checkInactivePostOwnership
} = require('../middleware/access.rules');

const router = express.Router();

router.get('/posts', checkUserStatus, postController.getAllPosts);
router.post('/posts/upload-files', postController.uploadPostMedia);
router.get('/posts/:post_id', checkInactivePostOwnership, checkUser, postController.getPostById);
router.get('/posts/:post_id/comments', checkUser, postController.getCommentsByPostId);
router.post('/posts/:post_id/comments', authMiddleware, postController.createComment);
router.get('/posts/:post_id/categories', postController.getCategoriesByPostId);
router.get('/posts/:post_id/file-names', postController.getFileNamesByPostId);

router.get('/posts/:post_id/like', postController.getLikesByPostId);
router.get('/posts/:post_id/like-status', authMiddleware, postController.getLikeStatus);
router.post('/posts/:post_id/like', authMiddleware, postController.createLike);
router.delete('/posts/:post_id/like', authMiddleware, postController.deleteLike);
router.post('/posts', authMiddleware, postController.createPost);
router.patch('/posts/:post_id', authMiddleware, checkPostOwnership, postController.updatePost);
router.delete('/posts/:post_id', authMiddleware, checkPostOwnership, postController.deletePost);


module.exports = router;