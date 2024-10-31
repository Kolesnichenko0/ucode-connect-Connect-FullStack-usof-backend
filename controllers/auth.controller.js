const {validationResult, body} = require('express-validator');
const daoManager = require('../dao/manager.dao');
const AuthService = require('../service/auth.service');

const authService = new AuthService(daoManager.userDAO);

class AuthController {
    async register(req, res) {
        await body('login')
            .isLength({min: 3, max: 30})
            .matches(/^[a-zA-Z0-9_]{3,30}$/)
            .withMessage('Login must be 3-30 characters long and contain only letters, numbers, and underscores.')
            .run(req);
        await body('email')
            .isEmail()
            .withMessage('Invalid email address.')
            .run(req);

        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(422).json({
                    success: false,
                    message: 'Validation error',
                    errors: errors.array()
                });
            }

            const {login, password, email, full_name} = req.body;
            const result = await authService.registerUser({login, password, email, full_name});

            if (result.success) {
                return res.status(201).json({
                    message: result.message,
                    data: result.data
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }

        } catch (error) {
            console.error('Error in register:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async verifyEmail(req, res) {
        const {token} = req.params;
        try {
            const result = await authService.verifyEmail(token);
            if (result.success) {
                return res.status(200).json({
                    message: result.message
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }
        } catch (error) {
            console.error('Error in verifyEmail:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async login(req, res) {
        await body('login')
            .optional()
            .isLength({min: 3})
            .withMessage('Login must be at least 3 characters long.')
            .run(req);
        await body('email')
            .optional()
            .isEmail()
            .withMessage('Invalid email address.')
            .run(req);
        await body('password')
            .isLength({min: 6})
            .withMessage('Password must be at least 6 characters long.')
            .run(req);

        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(422).json({
                    success: false,
                    message: 'Validation error',
                    errors: errors.array()
                });
            }

            const {login, email, password} = req.body;
            if (!login && !email) {
                return res.status(422).json({
                    success: false,
                    message: 'Either login or email is required.'
                });
            }

            const result = await authService.loginUser({login, email, password});

            if (result.success) {
                return res.status(200).json({
                    message: result.message,
                    data: result.data
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }

        } catch (error) {
            console.error('Error in login:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async refreshAccessToken(req, res) {
        const {refreshToken} = req.body;
        try {
            const result = await authService.refreshAccessToken(refreshToken);
            if (result.success) {
                return res.status(200).json({
                    message: result.message,
                    data: result.data
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }
        } catch (error) {
            console.error('Error in refreshToken:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async logout(req, res) {
        const {refreshToken} = req.body;
        try {
            const result = await authService.logoutUser(refreshToken);
            return res.status(200).json({
                message: result.message
            });
        } catch (error) {
            console.error('Error in logout:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async sendPasswordResetLink(req, res) {
        await body('email')
            .isEmail()
            .withMessage('Invalid email address.')
            .run(req);

        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(422).json({
                    success: false,
                    message: 'Validation error',
                    errors: errors.array()
                });
            }

            const {email} = req.body;
            const result = await authService.sendPasswordResetLink(email);

            if (result.success) {
                return res.status(200).json({
                    message: result.message
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }

        } catch (error) {
            console.error('Error in sendPasswordResetLink:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }

    async resetPassword(req, res) {
        await body('newPassword')
            .isLength({min: 6})
            .withMessage('Password must be at least 6 characters long.')
            .run(req);

        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(422).json({
                    success: false,
                    message: 'Validation error',
                    errors: errors.array()
                });
            }

            const {confirm_token} = req.params;
            const {newPassword} = req.body;
            const result = await authService.resetPassword(confirm_token, newPassword);

            if (result.success) {
                return res.status(200).json({
                    message: result.message
                });
            } else {
                return res.status(result.statusCode).json({
                    message: result.message
                });
            }

        } catch (error) {
            console.error('Error in resetPassword:', error);
            return res.status(500).json({
                message: 'Internal Server Error'
            });
        }
    }


}

module.exports = new AuthController();