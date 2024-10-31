const pool = require('../config/db');

const UserDAO = require('../dao/user.dao');
const PostDAO = require('../dao/post.dao');
const CommentDAO = require('../dao/comment.dao');
const CategoryDAO = require('../dao/category.dao');
const TokenDAO = require('../dao/token.dao');

class DAOManager {
    constructor(pool) {
        this.userDAO = new UserDAO(pool);
        this.commentDAO = new CommentDAO(pool);
        this.postDAO = new PostDAO(pool, this.commentDAO);
        this.categoryDAO = new CategoryDAO(pool);
        this.tokenDAO = new TokenDAO(pool);
    }
}

module.exports = new DAOManager(pool);