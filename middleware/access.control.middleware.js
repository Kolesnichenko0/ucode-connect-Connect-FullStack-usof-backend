const accessControlMiddleware = (checkFunction) => {
    return (req, res, next) => {
        if (!checkFunction(req)) {
            return res.status(403).json({message: 'Forbidden: Access denied'});
        }
        next();
    };
};

module.exports = accessControlMiddleware;

