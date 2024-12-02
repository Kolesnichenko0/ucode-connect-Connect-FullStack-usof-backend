const daoManager = require('../dao/manager.dao');

class PostService {
    constructor(postDAO) {
        this.postDAO = postDAO;
    }

    async getAllPosts(options) {
        return this.postDAO.findAllWithFilters(options);
    }

    async getPostById(postId, userId = null) {
        return this.postDAO.findById(postId, userId);
    }

    async createPost(data) {
        return this.postDAO.create(data);
    }

    async deletePost(postId) {
        return this.postDAO.delete(postId);
    }

    async getFavoritePosts(userId, options) {
        return this.postDAO.getFavoritePosts(userId, options);
    }

    async addFavoritePost(userId, postId) {
        return this.postDAO.addFavoritePost(userId, postId);
    }

    async removeFavoritePost(userId, postId) {
        return this.postDAO.removeFavoritePost(userId, postId);
    }

    async getCategoriesByPostId(postId) {
        return this.postDAO.getCategoriesByPostId(postId);
    }

    async getFileNamesByPostId(postId) {
        return this.postDAO.getFileNamesByPostId(postId);
    }

    async getLikesByPostId(postId) {
        return this.postDAO.getLikesByPostId(postId);
    }

    async addLike(userId, postId, type) {
        return this.postDAO.addLike(userId, postId, type);
    }

    async removeLike(userId, postId) {
        return this.postDAO.removeLike(userId, postId);
    }

    async getLikeStatus(userId, postId) {
        return this.postDAO.getLikeStatus(userId, postId);
    }

    async updatePost(postId, data) {
        const {category_ids, files, ...postData} = data;

        const updatedPost = await this.postDAO.update(postId, postData);
        if (!updatedPost) {
            return null;
        }
        if (category_ids && category_ids.length > 0) {
            await this.postDAO.updateCategories(postId, category_ids);
        }
        if (files !== undefined) {
            await this.postDAO.updateFiles(postId, files);
        }

        return this.getPostById(postId);
    }

    async getCommentsByPostId(postId, userId, isAdmin) {
        return this.postDAO.findCommentsByPostId(postId, userId, isAdmin);
    }

    async createComment(data) {
        return daoManager.commentDAO.create(data);
    }
}

module.exports = PostService;