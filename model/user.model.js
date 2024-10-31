const BaseModel = require('./base.model');

class User extends BaseModel {
    constructor(data = {}) {
        super(data);
        this.fields = [
            'login',
            'password',
            'full_name',
            'email',
            'profile_picture_name',
            'rating',
            'email_verified',
            'role'
        ];
        this.setData(data);
    }
}

module.exports = User;