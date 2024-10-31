const JwtUtils = require('../util/jwt/jwt.utils');
const daoManager = require('../dao/manager.dao');
const UserService = require('../service/user.service');
const userService = new UserService(daoManager.userDAO);
const PostService = require('../service/post.service');
const postService = new PostService(daoManager.postDAO);
const CommentService = require('../service/comment.service');
const commentService = new CommentService(daoManager.commentDAO);

const checkUserStatus = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        req.query.status = 'active';
        return next();
    }

    const decoded = JwtUtils.verifyAccessToken(token);

    if (!decoded) {
        req.query.status = 'active';
        return next();
    }

    try {
        const user = await userService.getUserById(decoded.userId);
        if (!user) {
            req.query.status = 'active';
            return next();
        }

        req.user = user;

        if (req.query.status == 'all') {
            req.query.status = user.role == 'admin' ? undefined : 'active';
        } else {
            req.query.status = 'active';
        }

        next();
    } catch (error) {
        console.error('Error in checkStatus:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const canModifyUser = (req) => {
    const userId = req.params.user_id;
    const user = req.user;
    return user.id == userId || user.role == 'admin';
};

const canDeleteUser = (req) => {
    const userId = req.params.user_id;
    const user = req.user;

    if (user.id == userId) {
        return true;
    }

    return user.role == 'admin';
};

const checkUserPosts = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        req.query.status = 'active';
        return next();
    }

    const decoded = JwtUtils.verifyAccessToken(token);

    if (!decoded) {
        req.query.status = 'active';
        return next();
    }

    try {
        const user = await userService.getUserById(decoded.userId);
        if (!user) {
            req.query.status = 'active';
            return next();
        }

        req.user = user;

        const userId = req.params.user_id;

        if (user.id == userId) {
            req.query.status = undefined;
        } else {
            req.query.status = 'active';
        }

        next();
    } catch (error) {
        console.error('Error in checkUserPosts:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const checkUser = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return next();
    }

    const decoded = JwtUtils.verifyAccessToken(token);

    if (!decoded) {
        return next();
    }

    try {
        const user = await userService.getUserById(decoded.userId);
        if (!user) {
            return next();
        }

        req.user = user;

        next();
    } catch (error) {
        console.error('Error in checkUserPosts:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const checkPostOwnership = async (req, res, next) => {
    try {
        const userId = req.user.id;
        const postId = req.params.post_id;

        const post = await postService.getPostById(postId);
        if (!post) {
            return res.status(404).json({message: 'Post not found'});
        }

        if (post.user_id !== userId && req.user.role !== 'admin') {
            return res.status(403).json({message: 'Forbidden: You do not have permission to delete this post'});
        }

        next();
    } catch (error) {
        console.error('Error in checkPostOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const checkInactivePostOwnership = async (req, res, next) => {
    try {
        const postId = req.params.post_id;
        const post = await postService.getPostById(postId);
        if (!post) {
            return res.status(404).json({message: 'Post not found'});
        }

        if (post.status == 'active') {
            return next();
        }

        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];

        if (!token) {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see inactive posts'});
        }

        const decoded = JwtUtils.verifyAccessToken(token);

        if (!decoded) {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see inactive posts'});
        }

        const user = await userService.getUserById(decoded.userId);

        req.user = user;

        if (post.user_id !== decoded.userId && req.user.role !== 'admin') {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see this post'});
        }

        next();
    } catch (error) {
        console.error('Error in checkInactivePostOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const checkInactiveCommentOwnership = async (req, res, next) => {
    try {
        const commentId = req.params.comment_id;
        const comment = await commentService.getCommentById(commentId);
        if (!comment) {
            return res.status(404).json({message: 'Comment not found'});
        }

        if (comment.status == 'active') {
            return next();
        }

        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];

        if (!token) {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see inactive posts'});
        }

        const decoded = JwtUtils.verifyAccessToken(token);

        if (!decoded) {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see inactive posts'});
        }

        const user = await userService.getUserById(decoded.userId);

        req.user = user;

        if (comment.user_id !== decoded.userId && req.user.role !== 'admin') {
            return res.status(403).json({message: 'Forbidden: You do not have permission to see this comment'});
        }

        next();
    } catch (error) {
        console.error('Error in checkInactivePostOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

const checkPostOwnershipWithoutAdmin = async (req, res, next) => {
    try {
        const userId = req.user.id;
        const postId = req.params.post_id;

        const post = await postService.getPostById(postId);
        if (!post) {
            return res.status(404).json({message: 'Post not found'});
        }

        if (post.user_id !== userId) {
            return res.status(403).json({message: 'Forbidden: You do not have permission to delete this post'});
        }

        next();
    } catch (error) {
        console.error('Error in checkPostOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

async function checkCommentOwnershipWithoutAdmin(req, res, next) {
    try {
        const commentId = req.params.comment_id;
        const userId = req.user.id;

        const comment = await daoManager.commentDAO.findById(commentId);
        if (!comment) {
            return res.status(404).json({message: 'Comment not found'});
        }

        if (comment.user_id !== userId) {
            return res.status(403).json({message: 'Forbidden: You do not own this comment'});
        }

        next();
    } catch (error) {
        console.error('Error in checkCommentOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
}

async function checkCommentOwnership(req, res, next) {
    try {
        const commentId = req.params.comment_id;
        const userId = req.user.id;

        const comment = await daoManager.commentDAO.findById(commentId);
        if (!comment) {
            return res.status(404).json({message: 'Comment not found'});
        }

        if (comment.user_id !== userId && req.user.role !== 'admin') {
            return res.status(403).json({message: 'Forbidden: You do not own this comment'});
        }

        next();
    } catch (error) {
        console.error('Error in checkCommentOwnership:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
}


module.exports = {
    canModifyUser,
    canDeleteUser,
    checkUserPosts,
    checkUserStatus,
    checkPostOwnership,
    checkPostOwnershipWithoutAdmin,
    checkUser,
    checkCommentOwnershipWithoutAdmin,
    checkCommentOwnership,
    checkInactivePostOwnership,
    checkInactiveCommentOwnership
};