const userMapper = require('../util/mapper/user.mapper');

class UserService {
    constructor(userDAO) {
        this.userDAO = userDAO;
    }

    async getAllUsers(options) {
        const users = await this.userDAO.findAll(options);
        const total = await this.userDAO.count();
        return {
            users: users.map(userMapper).map(user => ({
                ...user,
                profile_picture_url: `${process.env.SERVER_URL}/uploads/avatars/${user.profile_picture_name}`
            })),
            total
        };
    }

    async getUserById(userId) {
        const user = await this.userDAO.findById(userId);
        return userMapper(user);
    }

    async createUser(data) {
        const user = await this.userDAO.create(data);
        return userMapper(user);
    }

    async updateUser(userId, data) {
        const user = await this.userDAO.update(userId, data);
        return userMapper(user);
    }

    async deleteUser(userId) {
        return this.userDAO.delete(userId);
    }

    async updateAvatar(userId, avatarPath) {
        const user = await this.userDAO.updateAvatar(userId, avatarPath);
        return userMapper(user);
    }

    async findByLogin(login) {
        const user = await this.userDAO.findByLogin(login);
        if (!user) {
            return null;
        }
        return userMapper(user);
    }

    async findByEmail(email) {
        const user = await this.userDAO.findByEmail(email);
        if (!user) {
            return null;
        }
        return userMapper(user);
    }

    async getPasswordById(userId) {
        return this.userDAO.getPasswordById(userId);
    }
}

module.exports = UserService;