const express = require('express');
const categoryController = require('../controllers/category.controller');
const authMiddleware = require('../middleware/auth.middleware');
const roleMiddleware = require('../middleware/role.middleware');

const router = express.Router();

router.get('/categories', categoryController.getAllCategories);
router.get('/categories/:category_id', categoryController.getCategoryById);
router.get('/categories/:category_id/posts', categoryController.getCategoryPosts);
router.post('/categories', authMiddleware, roleMiddleware(['admin']), categoryController.createCategory);
router.patch('/categories/:category_id', authMiddleware, roleMiddleware(['admin']), categoryController.updateCategory);
router.delete('/categories/:category_id', authMiddleware, roleMiddleware(['admin']), categoryController.deleteCategory);

module.exports = router;