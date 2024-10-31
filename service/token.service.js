class TokenService {
    constructor(tokenDAO) {
        this.tokenDAO = tokenDAO;
    }

    async getAllTokens(options) {
        return this.tokenDAO.findAll(options);
    }

    async getTokenById(tokenId) {
        return this.tokenDAO.findById(tokenId);
    }

    async findByRefreshToken(refreshToken) {
        return this.tokenDAO.findByRefreshToken(refreshToken);
    }

    async createToken(data) {
        return this.tokenDAO.create(data);
    }

    async deleteToken(tokenId) {
        return this.tokenDAO.delete(tokenId);
    }
}

module.exports = TokenService;