const {v4: uuidv4} = require('uuid');
const path = require('path');
const fs = require('fs');
const mime = require('mime-types');

const savePhoto = async (file, subDir) => {
    if (!file || (!file.name && !file.data)) {
        throw new Error('Invalid file. The file is either undefined or missing key properties.');
    }
    const mimeType = mime.lookup(file.name);
    if (!mimeType || (!mimeType.startsWith('image/') && mimeType !== 'application/pdf')) {
        throw new Error('Invalid file format. Only images and PDFs are allowed.');
    }

    const uploadDir = path.join(__dirname, '../../', 'public', 'uploads', subDir);
    if (!fs.existsSync(uploadDir)) {
        fs.mkdirSync(uploadDir, {recursive: true});
    }

    const fileName = `${uuidv4()}${path.extname(file.name)}`;
    const filePath = path.join(uploadDir, fileName);

    if (file.data && Buffer.isBuffer(file.data)) {
        fs.writeFileSync(filePath, file.data);
    } else {
        await file.mv(filePath);
    }

    return fileName;
};

module.exports = {
    savePhoto
};
