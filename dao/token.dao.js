const BaseDAO = require('./base.dao');
const Token = require('../model/token.model');

class TokenDAO extends BaseDAO {
    constructor(pool) {
        super(pool, 'tokens', Token);
    }

    async findByRefreshToken(refreshToken) {
        return this.findByKey('refresh_token', refreshToken);
    }
}

module.exports = TokenDAO;