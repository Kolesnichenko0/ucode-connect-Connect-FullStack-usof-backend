class CategoryService {
    constructor(categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    async getAllCategories({limit = 30, offset = 0, orderBy = 'title', order = 'ASC', title = ''}) {
        const categories = await this.categoryDAO.findAll({limit, offset, orderBy, order, title});
        const total = await this.categoryDAO.count({});
        const found = await this.categoryDAO.count({title});
        return {
            categories,
            total,
            found
        };
    }

    async getCategoryById(categoryId) {
        return this.categoryDAO.findById(categoryId);
    }

    async getCategoryByTitle(title) {
        return this.categoryDAO.findByTitle(title);
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