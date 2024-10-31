const BaseModel = require('./base.model');

class Post extends BaseModel {
    constructor(data = {}) {
        super(data);
        this.fields = [
            'user_id',
            'title',
            'status',
            'content',
            'rating',
            'likes',
            'dislikes',
            'category_ids'
        ];
        this.setData(data);

    }
}

module.exports = Post;