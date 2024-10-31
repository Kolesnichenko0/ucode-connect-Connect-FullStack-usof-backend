class CommentService {
    constructor(commentDAO) {
        this.commentDAO = commentDAO;
    }

    async getCommentById(commentId) {
        return this.commentDAO.findById(commentId);
    }

    async createComment(data) {
        return this.commentDAO.create(data);
    }

    async updateComment(commentId, data) {
        return this.commentDAO.update(commentId, data);
    }

    async deleteComment(commentId) {
        return this.commentDAO.delete(commentId);
    }

    async getAllComments(options) {
        return this.commentDAO.findAllWithFilters(options);
    }

    async getLikesByCommentId(commentId) {
        return this.commentDAO.getLikesByCommentId(commentId);
    }

    async addLike(userId, commentId, type) {
        return this.commentDAO.addLike(userId, commentId, type);
    }

    async removeLike(userId, commentId) {
        return this.commentDAO.removeLike(userId, commentId);
    }

    async getLikeStatus(userId, commentId) {
        return this.commentDAO.getLikeStatus(userId, commentId);
    }
}

module.exports = CommentService;