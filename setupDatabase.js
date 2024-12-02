const mysql = require('mysql2/promise');
const {exec} = require('child_process');
const rootConfig = require('./config/config.root.json');
const appConfig = require('./config/config.app.json');
const path = './config/dump_dkolesnych_solve_stack_db_production_20240212.sql';

async function setupDatabase() {
    let connection;

    try {
        if (!appConfig.database) {
            throw new Error('Database name is not defined in the configuration.');
        }

        connection = await mysql.createConnection({
            host: rootConfig.host,
            user: rootConfig.user,
            password: rootConfig.password
        });

        await connection.query(`CREATE DATABASE IF NOT EXISTS \`${appConfig.database}\``);
        console.log(`Database "${appConfig.database}" created successfully.`);

        await connection.query(`GRANT ALL PRIVILEGES ON \`${appConfig.database}\`.* TO '${appConfig.user}'@'${appConfig.host}'`);
        await connection.query(`FLUSH PRIVILEGES`);
        console.log(`Privileges granted to user "${appConfig.user}"`);

        const command = `mysql -u${rootConfig.user} -p${rootConfig.password} ${appConfig.database} < ${path}`;

        exec(command, (error, stdout, stderr) => {
            if (error) {
                console.error(`Error executing dump: ${error.message}`);
                return;
            }
            console.log('SQL dump executed successfully.');
        });

    } catch (error) {
        console.error('Error setting up the database:', error);
    } finally {
        if (connection) {
            await connection.end();
        }
    }
}

setupDatabase();
