const JwtUtils = require('../util/jwt/jwt.utils');
const daoManager = require('../dao/manager.dao');
const UserService = require('../service/user.service');
const userService = new UserService(daoManager.userDAO);

const authMiddleware = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).json({message: 'No token provided, authorization denied'});
    }

    const decoded = JwtUtils.verifyAccessToken(token);

    if (!decoded) {
        return res.status(403).json({message: 'Invalid or expired token'});
    }

    try {
        const user = await userService.getUserById(decoded.userId);
        if (!user) {
            return res.status(404).json({message: 'User not found'});
        }

        req.user = user;
        next();
    } catch (error) {
        console.error('Error in authMiddleware:', error);
        return res.status(500).json({message: 'Internal Server Error'});
    }
};

module.exports = authMiddleware;
