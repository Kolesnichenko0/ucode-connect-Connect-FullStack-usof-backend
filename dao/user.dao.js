const BaseDAO = require('./base.dao');
const User = require('../model/user.model');


class UserDAO extends BaseDAO {
    constructor(pool) {
        super(pool, 'users', User);
    }

    async findByEmail(email) {
        return this.findByKey('email', email);
    }

    async findByLogin(login) {
        return this.findByKey('login', login);
    }

    async getPasswordById(userId) {
        const query = `SELECT password
                       FROM users
                       WHERE id = ?`;
        const [rows] = await this.pool.execute(query, [userId]);
        return rows.length ? rows[0].password : null;
    }
}

module.exports = UserDAO;