import AdminJS from 'adminjs';
import Plugin from '@adminjs/express';
import Adapter, {Database, Resource} from '@adminjs/sql';
import bcrypt from 'bcrypt';
import mysql from 'mysql2/promise';
import fs from 'fs';

AdminJS.registerAdapter({
    Database,
    Resource,
});

const config = JSON.parse(fs.readFileSync('./config/config.app.json', 'utf8'));

const pool = mysql.createPool({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database,
    connectionLimit: config.connectionLimit || 10
});

const initDatabase = async () => {
    try {
        const db = await new Adapter('mysql2', {
            database: config.database,
            user: config.user,
            password: config.password,
            host: config.host,
        }).init();
        return db;
    } catch (error) {
        console.error('Database initialization failed:', error);
        throw error;
    }
};

const timestampProperties = {
    created_at: {
        isVisible: {list: true, show: true, edit: false, filter: true},
        isDisabled: true
    },
    updated_at: {
        isVisible: {list: true, show: true, edit: false, filter: true},
        isDisabled: true
    }
};

const setupAdmin = async () => {
    try {
        const db = await initDatabase();

        const commonProperties = {
            id: {
                isVisible: {list: true, show: true, edit: false, filter: true},
                isDisabled: true
            },
            ...timestampProperties
        };

        const admin = new AdminJS({
            rootPath: '/admin',
            resources: [
                {
                    resource: db.table('users'),
                    options: {
                        listProperties: ['id', 'login', 'email', 'role', 'rating', 'created_at'],
                        filterProperties: ['id', 'login', 'email', 'role', 'rating', 'created_at'],
                        editProperties: ['login', 'password', 'email', 'full_name', 'role'],
                        showProperties: ['id', 'login', 'email', 'full_name', 'role', 'rating', 'created_at', 'updated_at'],
                        properties: {
                            ...commonProperties,
                            password: {
                                type: 'password',
                                isVisible: {
                                    list: false,
                                    show: false,
                                    edit: false,
                                    new: true
                                },
                            },
                            email: {
                                type: 'string',
                                isVisible: {
                                    list: true,
                                    show: true,
                                    edit: false,
                                    new: true
                                }
                            },
                            login: {
                                type: 'string',
                                isVisible: {
                                    list: true,
                                    show: true,
                                    edit: false,
                                    new: true
                                }
                            },
                            full_name: {
                                type: 'string',
                                isVisible: {
                                    list: true,
                                    show: true,
                                    edit: false,
                                    new: true
                                }
                            },
                            role: {
                                type: 'select',
                                availableValues: [
                                    {value: 'user', label: 'User'},
                                    {value: 'admin', label: 'Admin'},
                                ],
                                isVisible: {
                                    list: true,
                                    show: true,
                                    edit: true,
                                    new: true
                                }
                            },
                            rating: {
                                type: 'number',
                                isDisabled: true
                            }
                        },
                        actions: {
                            new: {
                                before: async (request) => {
                                    if (request.payload.password) {
                                        request.payload = {
                                            ...request.payload,
                                            password: await bcrypt.hash(request.payload.password, 10),
                                            rating: 0
                                        };
                                    }
                                    return request;
                                }
                            },
                            edit: {
                                before: async (request) => {
                                    if (request.payload.password) {
                                        request.payload = {
                                            ...request.payload,
                                            password: await bcrypt.hash(request.payload.password, 10)
                                        };
                                    } else {
                                        delete request.payload.password;
                                    }
                                    return request;
                                }
                            },
                        }
                    }
                },
                {
                    resource: db.table('posts'),
                    options: {
                        listProperties: ['id', 'title', 'user_id', 'status', 'rating', 'created_at'],
                        filterProperties: ['id', 'title', 'user_id', 'status', 'rating', 'created_at'],
                        editProperties: ['status'],
                        showProperties: ['id', 'title', 'content', 'user_id', 'status', 'rating', 'created_at', 'updated_at'],
                        properties: {
                            ...commonProperties,
                            content: {
                                type: 'textarea',
                                isRequired: true
                            },
                            title: {
                                type: 'string',
                                isRequired: true
                            },
                            user_id: {
                                type: 'number',
                                isRequired: true
                            },
                            status: {
                                type: 'select',
                                isRequired: true,
                                availableValues: [
                                    {value: 'active', label: 'Active'},
                                    {value: 'inactive', label: 'Inactive'},
                                ]
                            },
                            rating: {
                                type: 'number',
                                isDisabled: true
                            }
                        }
                    }
                },

                {
                    resource: db.table('categories'),
                    options: {
                        listProperties: ['id', 'title', 'created_at'],
                        filterProperties: ['id', 'title', 'created_at'],
                        editProperties: ['title', 'description'],
                        showProperties: ['id', 'title', 'description', 'created_at', 'updated_at'],
                        properties: {
                            ...commonProperties,
                            title: {
                                type: 'string',
                                isRequired: true
                            },
                            description: {
                                type: 'textarea',
                                isRequired: true
                            }
                        }
                    }
                },

                {
                    resource: db.table('comments'),
                    options: {
                        listProperties: ['id', 'user_id', 'post_id', 'status', 'created_at'],
                        filterProperties: ['id', 'user_id', 'post_id', 'status', 'created_at'],
                        editProperties: ['status'],
                        showProperties: ['id', 'content', 'user_id', 'post_id', 'status', 'created_at', 'updated_at'],
                        properties: {
                            ...commonProperties,
                            content: {
                                type: 'textarea',
                                isRequired: true
                            },
                            status: {
                                type: 'select',
                                isRequired: true,
                                availableValues: [
                                    {value: 'active', label: 'Active'},
                                    {value: 'inactive', label: 'Inactive'},
                                ]
                            }
                        }
                    }
                }
            ],
            branding: {
                companyName: 'Solve Stack Admin',
                softwareBrothers: false,
                logo: false,
                favicon: './assets/logo.png'
            }
        });

        async function findByEmail(email) {
            const [rows] = await pool.execute(
                'SELECT * FROM users WHERE email = ?',
                [email]
            );
            return rows[0];
        }

        const authenticate = async (email, password) => {
            const user = await findByEmail(email);
            if (!user || user.role !== 'admin') return null;

            const isPasswordValid = await bcrypt.compare(password, user.password);
            if (!isPasswordValid) return null;

            return {email: user.email, role: user.role};
        };

        const router = Plugin.buildAuthenticatedRouter(
            admin,
            {
                authenticate,
                cookieName: 'adminjs',
                cookiePassword: process.env.APP_SECRET || 'secure-secret-password',
            },
            null,
            {
                resave: false,
                saveUninitialized: false,
                secret: process.env.APP_SECRET || 'secure-secret-password'
            }
        );

        return router;
    } catch (error) {
        console.error('Admin setup failed:', error);
        throw error;
    }
};

export default setupAdmin();
