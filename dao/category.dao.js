const BaseDAO = require('./base.dao');
const Category = require('../model/category.model');

class CategoryDAO extends BaseDAO {
    constructor(pool) {
        super(pool, 'categories', Category);
    }

    async findByTitle(title) {
        const [rows] = await this.pool.execute(
            'SELECT * FROM categories WHERE title = ?',
            [title]
        );
        return rows[0];
    }

    async findAll({limit = 30, offset = 0, orderBy = 'title', order = 'ASC', title}) {
        const safeLimit = parseInt(limit, 10);
        const safeOffset = parseInt(offset, 10);
        const values = [];

        let whereClause = '';
        if (title) {
            whereClause = 'WHERE title LIKE ?';
            values.push(`%${title}%`);
        }

        const query = `
            SELECT *
            FROM ${this.tableName} ${whereClause}
            ORDER BY ${orderBy} ${order}
            LIMIT ${safeLimit}
            OFFSET ${safeOffset}
        `;

        const [rows] = await this.pool.execute(query, values);
        return rows;
    }

    async count({title = ''}) {
        const values = [];
        let whereClause = '';
        if (title) {
            whereClause = 'WHERE title LIKE ?';
            values.push(`%${title}%`);
        }

        const query = `
            SELECT COUNT(*) as count
            FROM ${this.tableName}
                ${whereClause}
        `;

        const [rows] = await this.pool.execute(query, values);
        return rows[0].count;
    }
}

module.exports = CategoryDAO;