class CategoryService {
    constructor(categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    async getAllCategories(options) {
        return this.categoryDAO.findAll(options);
    }

    async getCategoryById(categoryId) {
        return this.categoryDAO.findById(categoryId);
    }

    async createCategory(data) {
        return this.categoryDAO.create(data);
    }

    async updateCategory(categoryId, data) {
        return this.categoryDAO.update(categoryId, data);
    }

    async deleteCategory(categoryId) {
        return this.categoryDAO.delete(categoryId);
    }
}

module.exports = CategoryService;