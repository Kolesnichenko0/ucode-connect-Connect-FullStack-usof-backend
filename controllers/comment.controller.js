const CommentService = require('../service/comment.service');
const daoManager = require("../dao/manager.dao");
const {body, validationResult} = require('express-validator');

const commentService = new CommentService(daoManager.commentDAO);

class CommentController {
    async getAllComments(req, res) {
        try {
            const {page = 1, limit = 30} = req.query;
            const offset = (page - 1) * limit;

            const options = {
                limit,
                offset,
                orderBy: 'created_at',
                order: 'DESC'
            };

            const comments = await commentService.getAllComments(options);
            return res.status(200).json({
                message: 'Comments retrieved successfully',
                data: comments
            });
        } catch (error) {
            console.error('Error in getAllComments:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async updateComment(req, res) {
        await body('content')
            .optional()
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

            const commentId = req.params.comment_id;
            const {content, status} = req.body;

            let updateData = {};
            if (content) updateData.content = content;

            const comment = await commentService.getCommentById(commentId);

            if (req.user.role === 'admin' && comment.user_id !== req.user.id) {
                updateData = {};
            }

            if (req.user.role === 'admin' && status) {
                updateData.status = status;
            }

            if (req.user.role === 'user' && status == 'inactive') {
                updateData.status = status;
            }

            const updatedComment = await commentService.updateComment(commentId, updateData);
            if (!updatedComment) {
                return res.status(404).json({message: 'Comment not found'});
            }

            return res.status(200).json({
                success: true,
                message: 'Comment updated successfully',
                data: updatedComment
            });

        } catch (error) {
            console.error('Error in updateComment:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async deleteComment(req, res) {
        try {
            const commentId = req.params.comment_id;
            const deleted = await commentService.deleteComment(commentId);
            if (!deleted) {
                return res.status(404).json({message: 'Comment not found'});
            }
            return res.status(200).json({message: 'Comment deleted successfully'});
        } catch (error) {
            console.error('Error in deleteComment:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async getCommentById(req, res) {
        try {
            const commentId = req.params.comment_id;
            const comment = await commentService.getCommentById(commentId);
            if (!comment) {
                return res.status(404).json({
                    message: 'Comment not found'
                });
            }
            return res.status(200).json({
                message: 'Comment retrieved successfully',
                data: comment
            });
        } catch (error) {
            console.error('Error in getCommentById:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getLikesByCommentId(req, res) {
        try {
            const commentId = req.params.comment_id;
            const likesData = await commentService.getLikesByCommentId(commentId);
            return res.status(200).json({
                message: 'Likes and dislikes retrieved successfully',
                data: likesData
            });
        } catch (error) {
            console.error('Error in getLikesByCommentId:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createLike(req, res) {
        try {
            const userId = req.user.id;
            const commentId = req.params.comment_id;
            const {isLike} = req.body;

            const comment = await commentService.getCommentById(commentId);
            if (comment.user_id == userId) {
                return res.status(403).json({message: 'You cannot like your own comment'});
            }

            if (typeof isLike === 'undefined') {
                return res.status(400).json({message: 'Bad Request: isLike is required'});
            }
            let type = isLike === 'true' ? 'like' : 'dislike';

            await commentService.addLike(userId, commentId, type);

            return res.status(200).json({message: 'Like/dislike added successfully'});
        } catch (error) {
            console.error('Error in createLike:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async deleteLike(req, res) {
        try {
            const userId = req.user.id;
            const commentId = req.params.comment_id;

            await commentService.removeLike(userId, commentId);

            return res.status(200).json({message: 'Like removed successfully'});
        } catch (error) {
            console.error('Error in deleteLike:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }

    async getLikeStatus(req, res) {
        try {
            const userId = req.user.id;
            const commentId = req.params.comment_id;

            const likeStatus = await commentService.getLikeStatus(userId, commentId);

            return res.status(200).json({
                message: 'Like status retrieved successfully',
                data: likeStatus
            });
        } catch (error) {
            console.error('Error in getLikeStatus:', error);
            return res.status(500).json({message: 'Internal Server Error'});
        }
    }
}

module.exports = new CommentController();
