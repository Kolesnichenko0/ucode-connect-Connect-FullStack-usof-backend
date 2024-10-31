const BaseDAO = require('./base.dao');
const Category = require('../model/category.model');

class CategoryDAO extends BaseDAO {
    constructor(pool) {
        super(pool, 'categories', Category);
    }
}

module.exports = CategoryDAO;