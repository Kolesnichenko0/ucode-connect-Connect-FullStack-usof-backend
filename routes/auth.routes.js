const express = require('express');
const authController = require('../controllers/auth.controller.js');
const authMiddleware = require("../middleware/auth.middleware");

const router = express.Router();

router.post('/register', authController.register);
router.post('/login', authController.login);
router.post('/logout', authController.logout);
router.post('/access-token/refresh', authController.refreshAccessToken);
router.get('/verify-email/:token', authController.verifyEmail);
router.post('/password-reset', authController.sendPasswordResetLink);
router.post('/password-reset/:confirm_token', authController.resetPassword);

module.exports = router;