const bcrypt = require('bcrypt');
const jwtUtils = require('../util/jwt/jwt.utils');
const userMapper = require('../util/mapper/user.mapper');
const {validationResult} = require('express-validator');
const daoManager = require('../dao/manager.dao');
const TokenService = require('../service/token.service');
const tokenService = new TokenService(daoManager.tokenDAO);
const emailUtil = require('../util/email/email.util');

class AuthService {
    constructor(userDAO) {
        this.userDAO = userDAO;
    }

    async registerUser({login, password, email, full_name}) {
        const existingUserByEmail = await this.userDAO.findByEmail(email);
        if (existingUserByEmail) {
            return {
                success: false,
                message: 'Email already in use',
                statusCode: 409
            };
        }

        const existingUserByLogin = await this.userDAO.findByLogin(login);
        if (existingUserByLogin) {
            return {
                success: false,
                message: 'Login already in use',
                statusCode: 409
            };
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = await this.userDAO.create({
            login,
            password: hashedPassword,
            email,
            full_name
        });

        const emailToken = jwtUtils.generateEmailVerificationToken({userId: newUser.id});
        const verificationUrl = `http://localhost:5173/confirm-email/${emailToken}`;

        await emailUtil.sendVerificationEmail(email, verificationUrl);

        return {
            success: true,
            message: 'User registered successfully',
            data: userMapper(newUser)
        };
    }

    async verifyEmail(token) {
        const decoded = jwtUtils.verifyEmailToken(token);
        if (!decoded) {
            return {
                success: false,
                message: 'Invalid or expired token',
                statusCode: 400
            };
        }
        const user = await this.userDAO.findById(decoded.userId);
        if (!user) {
            return {
                success: false,
                message: 'User not found',
                statusCode: 404
            };
        }

        if (user.email_verified[0] == 1) {
            return {
                success: false,
                message: 'Email already verified',
                statusCode: 400
            };
        }

        await this.userDAO.update(user.id, {email_verified: Buffer.from([1])});

        return {
            success: true,
            message: 'Email verified successfully'
        };
    }


    async loginUser({login, email, password}) {
        let user;
        if (login) {
            user = await this.userDAO.findByLogin(login);
        } else if (email) {
            user = await this.userDAO.findByEmail(email);
        }

        if (!user) {
            return {
                success: false,
                message: 'User not found',
                statusCode: 404
            };
        }

        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
            return {
                success: false,
                message: 'Invalid password',
                statusCode: 401
            };
        }

        if (user.email_verified[0] == 0) {
            return {
                success: false,
                message: 'Email not verified',
                statusCode: 403
            };
        }

        const payload = {userId: user.id};
        const accessToken = jwtUtils.generateAccessToken(payload);
        const refreshToken = jwtUtils.generateRefreshToken(payload);

        await tokenService.createToken({refresh_token: refreshToken, user_id: user.id});

        return {
            success: true,
            message: 'Login successful',
            data: {
                accessToken,
                refreshToken,
                user: userMapper(user)
            }
        };
    }

    async refreshAccessToken(oldRefreshToken) {
        const decoded = jwtUtils.verifyRefreshToken(oldRefreshToken);
        if (!decoded) {
            return {
                success: false,
                message: 'Invalid refresh token',
                statusCode: 403
            };
        }

        const storedToken = await tokenService.findByRefreshToken(oldRefreshToken);
        if (!storedToken) {
            return {
                success: false,
                message: 'Token not found',
                statusCode: 404
            };
        }

        const payload = {userId: decoded.userId};
        const newAccessToken = jwtUtils.generateAccessToken(payload);

        return {
            success: true,
            message: 'Token refreshed',
            data: {
                accessToken: newAccessToken
            }
        };
    }

    async logoutUser(refreshToken) {
        const token = await tokenService.findByRefreshToken(refreshToken);
        await tokenService.deleteToken(token.id);
        return {
            success: true,
            message: 'Logout successful'
        };
    }

    async sendPasswordResetLink(email) {
        const user = await this.userDAO.findByEmail(email);
        if (!user) {
            return {
                success: false,
                message: 'User not found',
                statusCode: 404
            };
        }

        const resetToken = jwtUtils.generatePasswordResetToken({userId: user.id});
        const resetUrl = `http://localhost:5173/reset-password/${resetToken}`;

        await emailUtil.sendPasswordResetEmail(email, resetUrl);

        return {
            success: true,
            message: 'Password reset link sent to email'
        };
    }

    async resetPassword(token, newPassword) {
        const decoded = jwtUtils.verifyPasswordResetToken(token);
        if (!decoded) {
            return {
                success: false,
                message: 'Invalid or expired token',
                statusCode: 400
            };
        }

        const user = await this.userDAO.findById(decoded.userId);
        if (!user) {
            return {
                success: false,
                message: 'User not found',
                statusCode: 404
            };
        }

        const hashedPassword = await bcrypt.hash(newPassword, 10);
        await this.userDAO.update(user.id, {password: hashedPassword});

        return {
            success: true,
            message: 'Password reset successfully'
        };
    }
}

module.exports = AuthService;