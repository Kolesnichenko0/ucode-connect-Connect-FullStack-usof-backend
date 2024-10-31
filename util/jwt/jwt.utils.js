const jwt = require('jsonwebtoken');

class JwtUtils {
    constructor() {
        this.accessSecret = process.env.JWT_ACCESS_SECRET;
        this.refreshSecret = process.env.JWT_REFRESH_SECRET;
        this.emailSecret = process.env.JWT_EMAIL_SECRET;
        this.passwordResetSecret = process.env.JWT_PASSWORD_RESET_SECRET;
        this.accessExpiresIn = process.env.JWT_ACCESS_EXPIRES_IN;
        this.refreshExpiresIn = process.env.JWT_REFRESH_EXPIRES_IN;
        this.emailExpiresIn = process.env.JWT_EMAIL_EXPIRES_IN;
        this.passwordResetExpiresIn = process.env.JWT_PASSWORD_RESET_EXPIRES_IN;
    }

    generateAccessToken(payload) {
        return jwt.sign(payload, this.accessSecret, {expiresIn: this.accessExpiresIn});
    }

    generateRefreshToken(payload) {
        return jwt.sign(payload, this.refreshSecret, {expiresIn: this.refreshExpiresIn});
    }

    generateEmailVerificationToken(payload) {
        return jwt.sign(payload, this.emailSecret, {expiresIn: this.emailExpiresIn});
    }

    generatePasswordResetToken(payload) {
        return jwt.sign(payload, this.passwordResetSecret, {expiresIn: this.passwordResetExpiresIn});
    }

    verifyEmailToken(token) {
        try {
            return jwt.verify(token, this.emailSecret);
        } catch (error) {
            return null;
        }
    }

    verifyAccessToken(token) {
        try {
            return jwt.verify(token, this.accessSecret);
        } catch (error) {
            return null;
        }
    }

    verifyRefreshToken(token) {
        try {
            return jwt.verify(token, this.refreshSecret);
        } catch (error) {
            return null;
        }
    }

    verifyPasswordResetToken(token) {
        try {
            return jwt.verify(token, this.passwordResetSecret);
        } catch (error) {
            return null;
        }
    }


}

module.exports = new JwtUtils();
