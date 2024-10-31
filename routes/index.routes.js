const express = require('express');
const authRoutes = require('./auth.routes.js');
const userRoutes = require('./user.routes.js');
const postRoutes = require('./post.routes.js');
const categoryRoutes = require('./category.routes.js');
const commentRoutes = require('./comment.routes.js');

const router = express.Router();

router.use('/api/auth', authRoutes);
router.use('/api', userRoutes);
router.use('/api', postRoutes);
router.use('/api', categoryRoutes);
router.use('/api', commentRoutes);

module.exports = router;