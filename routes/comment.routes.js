const express = require('express');
const commentController = require('../controllers/comment.controller');
const authMiddleware = require('../middleware/auth.middleware');
const roleMiddleware = require("../middleware/role.middleware");
const { checkCommentOwnership, checkCommentOwnershipWithoutAdmin, checkInactivePostOwnership, checkInactiveCommentOwnership} = require('../middleware/access.rules');

const router = express.Router();

router.get('/comments', authMiddleware, roleMiddleware(['admin']), commentController.getAllComments);
router.get('/comments/:comment_id', checkInactiveCommentOwnership, commentController.getCommentById);
router.get('/comments/:comment_id/like', commentController.getLikesByCommentId);
router.post('/comments/:comment_id/like', authMiddleware, commentController.createLike);
router.delete('/comments/:comment_id/like', authMiddleware, commentController.deleteLike);
router.get('/comments/:comment_id/like-status', authMiddleware, commentController.getLikeStatus);
router.patch('/comments/:comment_id', authMiddleware, checkCommentOwnership, commentController.updateComment);
router.delete('/comments/:comment_id', authMiddleware, checkCommentOwnership, commentController.deleteComment);

module.exports = router;