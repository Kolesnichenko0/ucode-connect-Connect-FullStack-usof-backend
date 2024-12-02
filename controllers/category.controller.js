const CategoryService = require('../service/category.service');
const PostService = require('../service/post.service');
const daoManager = require('../dao/manager.dao');
const categoryService = new CategoryService(daoManager.categoryDAO);
const postService = new PostService(daoManager.postDAO);

class CategoryController {
    async getAllCategories(req, res) {
        try {
            const page = parseInt(req.query.page) || 1;
            const limit = parseInt(req.query.limit) || 30;
            const offset = (page - 1) * limit;
            const orderBy = 'title';
            const order = 'ASC';
            const title = req.query.title || '';

            const {categories, total, found} = await categoryService.getAllCategories({
                limit,
                offset,
                orderBy,
                order,
                title
            });
            return res.status(200).json({
                message: 'Categories retrieved successfully',
                data: categories,
                total: total,
                found: found
            });
        } catch (error) {
            console.error('Error in getAllCategories:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getCategoryById(req, res) {
        try {
            const categoryId = req.params.category_id;
            const category = await categoryService.getCategoryById(categoryId);
            if (!category) {
                return res.status(404).json({
                    message: 'Category not found'
                });
            }
            return res.status(200).json({
                message: 'Category retrieved successfully',
                data: category
            });
        } catch (error) {
            console.error('Error in getCategoryById:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async createCategory(req, res) {
        try {
            const {title, description} = req.body;
            const existingCategory = await categoryService.getCategoryByTitle(title);
            if (existingCategory) {
                return res.status(409).json({
                    message: 'Duplicate entry: A category with this title already exists'
                });
            }
            const newCategory = await categoryService.createCategory({title, description});
            return res.status(201).json({
                message: 'Category created successfully',
                data: newCategory
            });
        } catch (error) {
            console.error('Error in createCategory:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async updateCategory(req, res) {
        try {
            const categoryId = req.params.category_id;
            const {title, description} = req.body;
            const existingCategory = await categoryService.getCategoryByTitle(title);
            if (existingCategory && existingCategory.id != categoryId) {
                return res.status(409).json({
                    message: 'Duplicate entry: A category with this title already exists'
                });
            }
            const updatedCategory = await categoryService.updateCategory(categoryId, {title, description});
            if (!updatedCategory) {
                return res.status(404).json({
                    message: 'Category not found'
                });
            }
            return res.status(200).json({
                message: 'Category updated successfully',
                data: updatedCategory
            });
        } catch (error) {
            console.error('Error in updateCategory:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async deleteCategory(req, res) {
        try {
            const categoryId = req.params.category_id;
            const deleted = await categoryService.deleteCategory(categoryId);
            if (!deleted) {
                return res.status(404).json({
                    message: 'Category not found'
                });
            }
            return res.status(200).json({
                message: 'Category deleted successfully'
            });
        } catch (error) {
            console.error('Error in deleteCategory:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async getCategoryPosts(req, res) {
        try {
            const {page = 1, limit = 30} = req.query;
            const categoryId = req.params.category_id;
            const offset = (page - 1) * limit;

            const conditions = {
                status: 'active'
            };

            const options = {
                limit,
                offset,
                conditions,
                category_id: categoryId
            };

            const posts = await postService.getAllPosts(options);
            return res.status(200).json({
                message: 'Posts retrieved successfully',
                data: posts
            });
        } catch (error) {
            console.error('Error in getCategoryPosts:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }
}

module.exports = new CategoryController();