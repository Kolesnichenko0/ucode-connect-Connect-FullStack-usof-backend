const BaseModel = require('./base.model');

class Comment extends BaseModel {
    constructor(data = {}) {
        super(data);
        this.fields = [
            'user_id',
            'post_id',
            'parent_comment_id',
            'content',
            'status',
            'rating',
            'likes',
            'dislikes'
        ];
        this.setData(data);

    }
}

module.exports = Comment;