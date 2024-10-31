const BaseDAO = require('./base.dao');
const Comment = require('../model/comment.model');

class CommentDAO extends BaseDAO {
    constructor(pool) {
        super(pool, 'comments', Comment);
    }

    async findAllWithFilters(options = {}) {
        const { limit = 30, offset = 0, orderBy = 'created_at', order = 'DESC' } = options;

        const safeLimit = parseInt(limit, 10);
        const safeOffset = parseInt(offset, 10);

        const query = `
            SELECT comments.*, get_comment_likes(comments.id) AS likes, get_comment_dislikes(comments.id) AS dislikes
            FROM ${this.tableName}
            ORDER BY ${orderBy} ${order}
        LIMIT ${safeLimit}
            OFFSET ${safeOffset}
        `;

        const [rows] = await this.pool.execute(query);
        return rows.map(row => this._createModel(row));
    }

    async findCommentsByPostId(postId, userId) {
        let query;
        let params;

        if (userId) {
            query = `
                SELECT *
                FROM comments
                WHERE post_id = ?
                  AND (status = 'active' OR (status = 'inactive' AND user_id = ?))
            `;
            params = [postId, userId];
        } else {
            query = `
        SELECT *
        FROM comments
        WHERE post_id = ?
        AND status = 'active'
    `;
            params = [postId];
        }

        const [rows] = await this.pool.execute(query, params);
        const comments = rows.map(row => this._createModel(row));

        for (const comment of comments) {
            const [likesRows] = await this.pool.execute(
                `SELECT get_comment_likes(?) AS likes, get_comment_dislikes(?) AS dislikes`,
                [comment.id, comment.id]
            );
            comment.likes = likesRows[0].likes;
            comment.dislikes = likesRows[0].dislikes;
        }

        return comments;
    }

    async findById(commentId) {
        const [rows] = await this.pool.execute(
            `SELECT * FROM ${this.tableName} WHERE id = ?`,
            [commentId]
        );

        if (rows.length === 0) {
            return null;
        }

        const comment = rows[0];

        const [likesRows] = await this.pool.execute(
            `SELECT get_comment_likes(?) AS likes, get_comment_dislikes(?) AS dislikes`,
            [commentId, commentId]
        );

        comment.likes = likesRows[0].likes;
        comment.dislikes = likesRows[0].dislikes;

        return comment;
    }

    async getLikesByCommentId(commentId) {
        const query = `
            SELECT id, user_id, comment_id, type, created_at, updated_at
            FROM comment_likes
            WHERE comment_id = ?
        `;
        const [rows] = await this.pool.execute(query, [commentId]);
        return rows;
    }

    async addLike(userId, commentId, type) {
        const updateQuery = `
            UPDATE comment_likes
            SET type = ?
            WHERE user_id = ?
              AND comment_id = ?
        `;
        const [updateResult] = await this.pool.execute(updateQuery, [type, userId, commentId]);

        if (updateResult.affectedRows === 0) {
            const insertQuery = `
                INSERT INTO comment_likes (user_id, comment_id, type)
                VALUES (?, ?, ?)
            `;
            await this.pool.execute(insertQuery, [userId, commentId, type]);
        }
    }

    async removeLike(userId, commentId) {
        const query = `
            DELETE
            FROM comment_likes
            WHERE user_id = ?
              AND comment_id = ?
        `;
        await this.pool.execute(query, [userId, commentId]);
    }

    async getLikeStatus(userId, commentId) {
        const query = `
            SELECT type
            FROM comment_likes
            WHERE user_id = ?
              AND comment_id = ?
        `;
        const [rows] = await this.pool.execute(query, [userId, commentId]);
        return rows.length ? rows[0].type : null;
    }
}

module.exports = CommentDAO;