const BaseModel = require('./base.model');

class Category extends BaseModel {
    constructor(data = {}) {
        super(data);
        this.fields = [
            'title',
            'description'
        ];
        this.setData(data);

    }
}

module.exports = Category;