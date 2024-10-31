const nodemailer = require('nodemailer');
const {google} = require('googleapis');

const CLIENT_ID = process.env.GMAIL_CLIENT_ID;
const CLIENT_SECRET = process.env.GMAIL_CLIENT_SECRET;
const REDIRECT_URI = process.env.GMAIL_REDIRECT_URI;
const REFRESH_TOKEN = process.env.GMAIL_REFRESH_TOKEN;

const oAuth2Client = new google.auth.OAuth2(CLIENT_ID, CLIENT_SECRET, REDIRECT_URI);
oAuth2Client.setCredentials({refresh_token: REFRESH_TOKEN});

async function sendVerificationEmail(email, verificationUrl) {
    try {
        const accessToken = await oAuth2Client.getAccessToken();

        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                type: 'OAuth2',
                user: process.env.GMAIL_USER,
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET,
                refreshToken: REFRESH_TOKEN,
                accessToken: accessToken.token
            }
        });

        const mailOptions = {
            from: `Solve Stack <${process.env.GMAIL_USER}>`,
            to: email,
            subject: 'Verify Your Email - Solve Stack',
            html: `
        <div style="font-family: Arial, sans-serif; color: #333;">
            <div style="text-align: center; padding: 20px; background-color: #e8f5e9; border-radius: 8px;">
                <h2 style="color: #388e3c;">Welcome to Solve Stack!</h2>
                <p style="color: #4caf50;">We're excited to have you in our community.</p>
                <a href="${verificationUrl}" 
                   style="display: inline-block; padding: 10px 20px; font-size: 16px; color: white; background-color: #66bb6a; text-decoration: none; border-radius: 4px; margin-top: 10px;">
                    Verify Your Email
                </a>
                <p style="margin-top: 20px; color: #777;">If you didn't sign up for Solve Stack, please ignore this email.</p>
            </div>
        </div>
    `
        };
        const result = await transporter.sendMail(mailOptions);
        return result;
    } catch (error) {
        console.error('Error sending email:', error);
        throw error;
    }
}

async function sendPasswordResetEmail(email, resetUrl) {
    try {
        const accessToken = await oAuth2Client.getAccessToken();

        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                type: 'OAuth2',
                user: process.env.GMAIL_USER,
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET,
                refreshToken: REFRESH_TOKEN,
                accessToken: accessToken.token
            }
        });

        const mailOptions = {
            from: `Solve Stack <${process.env.GMAIL_USER}>`,
            to: email,
            subject: 'Password Reset Request - Solve Stack',
            html: `
        <div style="font-family: Arial, sans-serif; color: #333;">
            <div style="text-align: center; padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
                <h2 style="color: #388e3c;">Password Reset Requested</h2>
                <p style="color: #4caf50;">We received a request to reset your password for Solve Stack.</p>
                <a href="${resetUrl}" 
                   style="display: inline-block; padding: 10px 20px; font-size: 16px; color: white; background-color: #66bb6a; text-decoration: none; border-radius: 4px; margin-top: 10px;">
                    Reset Password
                </a>
                <p style="margin-top: 20px; color: #777;">If you did not request a password reset, please ignore this email.</p>
            </div>
        </div>
    `
        };

        const result = await transporter.sendMail(mailOptions);
        return result;
    } catch (error) {
        console.error('Error sending email:', error);
        throw error;
    }
}

module.exports = {
    sendVerificationEmail,
    sendPasswordResetEmail
};