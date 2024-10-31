const BaseModel = require('./base.model');

class Token extends BaseModel {
    constructor(data = {}) {
        super(data);
        this.fields = [
            'user_id',
            'refresh_token'
        ];
        this.setData(data);

    }
}

module.exports = Token;