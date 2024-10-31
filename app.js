require('dotenv').config();
const express = require('express');
const path = require('path');
const fileUpload = require('express-fileupload');
const indexRoutes = require('./routes/index.routes.js');
const swaggerUi = require('swagger-ui-express');
const fs = require('fs');

const swaggerDocument = JSON.parse(fs.readFileSync(path.join(__dirname, 'docs', 'openapi.json'), 'utf8'));

const app = express();
const PORT = process.env.PORT;

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));


app.use((err, req, res, next) => {
    if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
        return res.status(400).json({error: 'Bad request'});
    }
    next(err);
});

async function setupAdminRouter() {
    try {
        const {default: adminRouter} = await import('./admin.mjs');
        const router = await adminRouter;

        app.use('/admin', (req, res, next) => {
            console.log('Admin request:', {
                method: req.method,
                path: req.path,
                contentType: req.get('Content-Type')
            });
            next();
        });

        app.use('/admin', router);

        setupMiddleware();
    } catch (error) {
        console.error('Failed to load admin router:', error);
        throw error;
    }
}

function setupMiddleware() {

    app.use('/admin/assets', express.static(path.join(__dirname, 'public/assets')));

    app.use(express.static(path.join(__dirname, 'public')));
    app.use(fileUpload({
        createParentPath: true,
        limits: {
            fileSize: 50 * 1024 * 1024 // 50MB max-file-size
        },
        abortOnLimit: true,
        responseOnLimit: 'File size limit has been reached'
    }));

    app.use(express.json());
    app.use(express.urlencoded({extended: true}));

    app.use((req, res, next) => {
        if (req.is('multipart/form-data')) {
            next();
        } else if (req.is('image/*')) {
            express.raw({type: 'image/*', limit: '50mb'})(req, res, next);
        } else {
            next();
        }
    });

    app.use(indexRoutes);

    app.use(express.static('public'));

    app.use((err, req, res, next) => {
        console.error('Error occurred:', err);
        res.status(err.status || 500).json({
            error: process.env.NODE_ENV === 'production'
                ? 'Internal server error'
                : err.message
        });
    });

    app.use((req, res) => {
        res.status(404).json({error: 'Not found'});
    });
}

setupAdminRouter()
    .then(() => {
        app.listen(PORT, () => {
            console.log(`Server running on http://localhost:${PORT}`);
            console.log(`Admin panel available at http://localhost:${PORT}/admin`);
            console.log(`API documentation available at http://localhost:${PORT}/api-docs`);
        });
    })
    .catch(error => {
        console.error('Failed to start server:', error);
        process.exit(1);
    });