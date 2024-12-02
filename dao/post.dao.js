const BaseDAO = require('./base.dao');
const Post = require('../model/post.model');

class PostDAO extends BaseDAO {
    constructor(pool, commentDAO) {
        super(pool, 'posts', Post);
        this.commentDAO = commentDAO;
    }

    async findAllWithFilters(options = {}) {
        const {
            limit = 30,
            offset = 0,
            conditions = {},
            orderBy = 'rating',
            order = 'DESC',
            category_id,
            category_ids = [],
            startDate,
            endDate
        } = options;

        const safeLimit = parseInt(limit, 10);
        const safeOffset = parseInt(offset, 10);

        const keys = Object.keys(conditions);
        const values = Object.values(conditions);

        let whereClause = keys.length ? `WHERE ${keys.map(key => key === 'title' ? `${key} LIKE ?` : `${key} = ?`).join(' AND ')}` : '';
        let joinClause = '';

        if (category_id) {
            joinClause = 'JOIN posts_categories ON posts.id = posts_categories.post_id';
            whereClause += whereClause ? ' AND ' : 'WHERE ';
            whereClause += 'posts_categories.category_id = ?';
            values.push(category_id);
        } else if (category_ids.length > 0) {
            joinClause = 'JOIN posts_categories ON posts.id = posts_categories.post_id';
            whereClause += whereClause ? ' AND ' : 'WHERE ';
            whereClause += `posts_categories.category_id IN (${category_ids.map(() => '?').join(', ')})`;
            values.push(...category_ids);
        }

        if (startDate && endDate) {
            whereClause += whereClause ? ' AND ' : 'WHERE ';
            whereClause += 'posts.created_at BETWEEN ? AND ?';
            values.push(startDate, endDate);
        } else if (startDate) {
            whereClause += whereClause ? ' AND ' : 'WHERE ';
            whereClause += 'posts.created_at >= ?';
            values.push(startDate);
        } else if (endDate) {
            whereClause += whereClause ? ' AND ' : 'WHERE ';
            whereClause += 'posts.created_at <= ?';
            values.push(endDate);
        }

        const dataQuery = `
            SELECT posts.*, get_post_likes(posts.id) AS likes
            FROM ${this.tableName} ${joinClause} ${whereClause}
            ORDER BY ${orderBy} ${order}
                LIMIT ${safeLimit}
            OFFSET ${safeOffset}
        `;

        const foundQuery = `
            SELECT COUNT(DISTINCT posts.id) as found
            FROM ${this.tableName} ${joinClause} ${whereClause}
        `;

        const totalQuery = `
            SELECT COUNT(*) as total
            FROM ${this.tableName}
        `;

        const [dataRows, foundRows, totalRows] = await Promise.all([
            this.pool.execute(dataQuery, values),
            this.pool.execute(foundQuery, values),
            this.pool.execute(totalQuery, [])
        ]);

        const posts = dataRows[0].map(row => this._createModel(row));
        const found = foundRows[0][0].found;
        const total = totalRows[0][0].total;

        for (const post of posts) {
            const [likesRows] = await this.pool.execute(
                `SELECT get_post_likes(?) AS likes, get_post_dislikes(?) AS dislikes`,
                [post.id, post.id]
            );
            post.likes = likesRows[0].likes;
            post.dislikes = likesRows[0].dislikes;

            const [categoryRows] = await this.pool.execute(
                `SELECT category_id
                 FROM posts_categories
                 WHERE post_id = ?`,
                [post.id]
            );
            post.category_ids = categoryRows.map(row => row.category_id);
        }

        return {posts, found, total};
    }


    async findCommentsByPostId(postId, userId, isAdmin = false) {
        let query;
        let params;

        if (userId) {
            query = `
                SELECT *
                FROM comments
                WHERE post_id = ?
                  AND (status = 'active' OR (status = 'inactive' AND (user_id = ? OR ?)))
                ORDER BY rating DESC
            `;
            params = [postId, userId, isAdmin];
        } else {
            query = `
                SELECT *
                FROM comments
                WHERE post_id = ?
                  AND status = 'active'
                ORDER BY rating DESC
            `;
            params = [postId];
        }

        const [rows] = await this.pool.execute(query, params);
        const comments = rows.map(row => this.commentDAO._createModel(row));

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

    async create(data) {
        const {category_ids = [], files = [], ...postData} = data;
        const model = new this.ModelClass(postData);
        const modelData = model.toJSON();

        const keys = Object.keys(modelData);
        const values = Object.values(modelData);
        const placeholders = keys.map(() => '?').join(', ');

        const query = `
            INSERT INTO ${this.tableName} (${keys.join(', ')})
            VALUES (${placeholders})
        `;

        const connection = await this.pool.getConnection();
        try {
            await connection.beginTransaction();

            const [result] = await connection.execute(query, values);
            const postId = result.insertId;

            if (category_ids && category_ids.length > 0) {
                const categoryQuery = `
                    INSERT INTO posts_categories (post_id, category_id)
                    VALUES ${category_ids.map(() => '(?, ?)').join(', ')}
                `;
                const categoryValues = category_ids.flatMap(categoryId => [postId, categoryId]);
                await connection.execute(categoryQuery, categoryValues);
            }

            if (files && files.length > 0) {
                const fileQuery = `
                    INSERT INTO post_files (post_id, file_name)
                    VALUES ${files.map(() => '(?, ?)').join(', ')}
                `;
                const fileValues = files.flatMap(fileName => [postId, fileName]);
                await connection.execute(fileQuery, fileValues);
            }

            await connection.commit();
            return this.findById(postId);
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async getFavoritePosts(userId, options = {}) {
        const {
            limit = 3,
            offset = 0,
            conditions = {},
            orderBy = 'posts.created_at',
            order = 'DESC',
            category_id,
            category_ids = [],
            startDate,
            endDate
        } = options;

        const safeLimit = parseInt(limit, 10);
        const safeOffset = parseInt(offset, 10);

        const keys = Object.keys(conditions);
        const values = Object.values(conditions);
        values.unshift(userId);

        let whereClause = 'WHERE favorite_posts.user_id = ? AND posts.status = \'active\'';
        let joinClause = 'JOIN posts ON favorite_posts.post_id = posts.id';

        if (keys.length) {
            whereClause += ' AND ' + keys.map(key => key === 'title' ? `posts.${key} LIKE ?` : `posts.${key} = ?`).join(' AND ');
        }

        if (category_id) {
            joinClause += ' JOIN posts_categories ON posts.id = posts_categories.post_id';
            whereClause += ' AND posts_categories.category_id = ?';
            values.push(category_id);
        } else if (category_ids.length > 0) {
            joinClause += ' JOIN posts_categories ON posts.id = posts_categories.post_id';
            whereClause += ` AND posts_categories.category_id IN (${category_ids.map(() => '?').join(', ')})`;
            values.push(...category_ids);
        }

        if (startDate && endDate) {
            whereClause += ' AND posts.created_at BETWEEN ? AND ?';
            values.push(startDate, endDate);
        } else if (startDate) {
            whereClause += ' AND posts.created_at >= ?';
            values.push(startDate);
        } else if (endDate) {
            whereClause += ' AND posts.created_at <= ?';
            values.push(endDate);
        }

        const dataQuery = `
            SELECT posts.*, get_post_likes(posts.id) AS likes
            FROM favorite_posts ${joinClause} ${whereClause}
            ORDER BY ${orderBy} ${order}
                LIMIT ${safeLimit}
            OFFSET ${safeOffset}
        `;

        const foundQuery = `
            SELECT COUNT(DISTINCT posts.id) as found
            FROM favorite_posts
                ${joinClause}
                ${whereClause}
        `;

        const totalQuery = `
            SELECT COUNT(*) as total
            FROM favorite_posts
            WHERE user_id = ?
        `;

        const [dataRows, foundRows, totalRows] = await Promise.all([
            this.pool.execute(dataQuery, values),
            this.pool.execute(foundQuery, values),
            this.pool.execute(totalQuery, [userId])
        ]);

        const posts = dataRows[0].map(row => this._createModel(row));
        const found = foundRows[0][0].found;
        const total = totalRows[0][0].total;

        for (const post of posts) {
            const [likesRows] = await this.pool.execute(
                `SELECT get_post_likes(?) AS likes, get_post_dislikes(?) AS dislikes`,
                [post.id, post.id]
            );
            post.likes = likesRows[0].likes;
            post.dislikes = likesRows[0].dislikes;

            const [categoryRows] = await this.pool.execute(
                `SELECT category_id
                 FROM posts_categories
                 WHERE post_id = ?`,
                [post.id]
            );
            post.category_ids = categoryRows.map(row => row.category_id);
        }

        return {posts, found, total};
    }

    async addFavoritePost(userId, postId) {
        const query = `
            INSERT INTO favorite_posts (user_id, post_id)
            VALUES (?, ?)
        `;
        await this.pool.execute(query, [userId, postId]);
    }

    async removeFavoritePost(userId, postId) {
        const query = `
            DELETE
            FROM favorite_posts
            WHERE user_id = ?
              AND post_id = ?
        `;
        await this.pool.execute(query, [userId, postId]);
    }

    async getCategoriesByPostId(postId) {
        const query = `
            SELECT categories.*
            FROM categories
                     JOIN posts_categories ON categories.id = posts_categories.category_id
            WHERE posts_categories.post_id = ?
        `;
        const [rows] = await this.pool.execute(query, [postId]);
        return rows;
    }

    async getFileNamesByPostId(postId) {
        const query = `
            SELECT file_name
            FROM post_files
            WHERE post_id = ?
        `;
        const [rows] = await this.pool.execute(query, [postId]);
        return rows.map(row => ({
            file_name: row.file_name,
            file_url: `${process.env.BASE_URL}/uploads/posts/${row.file_name}`
        }));
    }

    async getLikesByPostId(postId) {
        const query = `
            SELECT id, user_id, post_id, type, created_at, updated_at
            FROM posts_likes
            WHERE post_id = ?
        `;
        const [rows] = await this.pool.execute(query, [postId]);
        return rows;
    }

    async findById(id, userId = null) {
        const [rows] = await this.pool.execute(
            `SELECT *
             FROM ${this.tableName}
             WHERE id = ?`,
            [id]
        );
        const post = this._createModel(rows[0]);

        if (post) {
            const [likesRows] = await this.pool.execute(
                `SELECT get_post_likes(?) AS likes, get_post_dislikes(?) AS dislikes`,
                [post.id, post.id]
            );
            post.likes = likesRows[0].likes;
            post.dislikes = likesRows[0].dislikes;

            const [categoryRows] = await this.pool.execute(
                `SELECT category_id
                 FROM posts_categories
                 WHERE post_id = ?`,
                [post.id]
            );
            post.category_ids = categoryRows.map(row => row.category_id);

            if (userId) {
                const [favoriteRows] = await this.pool.execute(
                    `SELECT COUNT(*) AS isFavourite
                     FROM favorite_posts
                     WHERE user_id = ?
                       AND post_id = ?`,
                    [userId, post.id]
                );
                post.isFavourite = favoriteRows[0].isFavourite > 0;
            }
        }

        return post;
    }


    async addLike(userId, postId, type) {
        const updateQuery = `
            UPDATE posts_likes
            SET type = ?
            WHERE user_id = ?
              AND post_id = ?
        `;
        const [updateResult] = await this.pool.execute(updateQuery, [type, userId, postId]);

        if (updateResult.affectedRows === 0) {
            const insertQuery = `
                INSERT INTO posts_likes (user_id, post_id, type)
                VALUES (?, ?, ?)
            `;
            await this.pool.execute(insertQuery, [userId, postId, type]);
        }
    }

    async removeLike(userId, postId) {
        const query = `
            DELETE
            FROM posts_likes
            WHERE user_id = ?
              AND post_id = ?
        `;
        await this.pool.execute(query, [userId, postId]);
    }

    async getLikeStatus(userId, postId) {
        const query = `
            SELECT type
            FROM posts_likes
            WHERE user_id = ?
              AND post_id = ?
        `;
        const [rows] = await this.pool.execute(query, [userId, postId]);
        return rows.length ? rows[0].type : null;
    }

    async updateCategories(postId, category_ids) {
        const connection = await this.pool.getConnection();
        try {
            await connection.beginTransaction();

            await connection.execute(`DELETE
                                      FROM posts_categories
                                      WHERE post_id = ?`, [postId]);

            if (category_ids && category_ids.length > 0) {
                const categoryQuery = `
                    INSERT INTO posts_categories (post_id, category_id)
                    VALUES ${category_ids.map(() => '(?, ?)').join(', ')}
                `;
                const categoryValues = category_ids.flatMap(categoryId => [postId, categoryId]);
                await connection.execute(categoryQuery, categoryValues);
            }

            await connection.commit();
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }

    async updateFiles(postId, files) {
        const connection = await this.pool.getConnection();
        try {
            await connection.beginTransaction();

            await connection.execute(`DELETE
                                      FROM post_files
                                      WHERE post_id = ?`, [postId]);

            if (files && files.length > 0) {
                const fileQuery = `
                    INSERT INTO post_files (post_id, file_name)
                    VALUES ${files.map(() => '(?, ?)').join(', ')}
                `;
                const fileValues = files.flatMap(fileName => [postId, fileName]);
                await connection.execute(fileQuery, fileValues);
            }

            await connection.commit();
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    }
}

module.exports = PostDAO;


