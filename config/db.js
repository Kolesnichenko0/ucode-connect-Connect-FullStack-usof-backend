const mysql = require('mysql2/promise');
const config = require('./config.app.json');

const pool = mysql.createPool({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database,
    connectionLimit: config.connectionLimit
});

module.exports = pool;
