class BaseDAO {
    constructor(pool, tableName, ModelClass) {
        this.pool = pool;
        this.tableName = tableName;
        this.ModelClass = ModelClass;
    }

    _createModel(data) {
        return data ? new this.ModelClass(data) : null;
    }

    async findById(id) {
        const [rows] = await this.pool.execute(
            `SELECT *
             FROM ${this.tableName}
             WHERE id = ?`,
            [id]
        );
        return this._createModel(rows[0]);
    }

    async findByIds(ids) {
        if (!Array.isArray(ids) || ids.length === 0) {
            return [];
        }

        const placeholders = ids.map(() => '?').join(', ');
        const query = `SELECT *
                       FROM ${this.tableName}
                       WHERE id IN (${placeholders})`;

        const [rows] = await this.pool.execute(query, ids);
        return rows.map(row => this._createModel(row));
    }

    async findByKey(key, value) {
        const [rows] = await this.pool.execute(
            `SELECT *
             FROM ${this.tableName}
             WHERE ${key} = ?`,
            [value]
        );
        return this._createModel(rows[0]);
    }

    async findByKeys(criteria) {
        const keys = Object.keys(criteria);
        const values = Object.values(criteria);
        const conditions = keys.map(key => `${key} = ?`).join(' AND ');

        const query = `SELECT *
                       FROM ${this.tableName}
                       WHERE ${conditions}`;
        const [rows] = await this.pool.execute(query, values);

        return rows.map(row => this._createModel(row));
    }

    async findByFieldValue(key, value) {
        const [rows] = await this.pool.execute(
            `SELECT *
             FROM ${this.tableName}
             WHERE ${key} = ?`,
            [value]
        );
        return rows.map(row => this._createModel(row));
    }

    async findAll(options = {}) {
        const {limit = 30, offset = 0, orderBy = 'id', order = 'ASC', conditions = {}} = options;

        const safeLimit = parseInt(limit, 10);
        const safeOffset = parseInt(offset, 10);

        const keys = Object.keys(conditions);
        const values = Object.values(conditions);
        const whereClause = keys.length ? `WHERE ${keys.map(key => `${key} = ?`).join(' AND ')}` : '';

        const query = `
            SELECT *
            FROM ${this.tableName} ${whereClause}
            ORDER BY ${orderBy} ${order}
        LIMIT ${safeLimit}
            OFFSET ${safeOffset}
        `;

        const [rows] = await this.pool.execute(query, values);
        return rows.map(row => this._createModel(row));
    }

    async findAllWithConditions(conditions = {}, options = {}) {
        const {limit = 30, offset = 0, orderBy = 'id', order = 'ASC'} = options;
        const keys = Object.keys(conditions);
        const values = Object.values(conditions);
        const whereClause = keys.length ? `WHERE ${keys.map(key => `${key} = ?`).join(' AND ')}` : '';

        const query = `
            SELECT *
            FROM ${this.tableName} ${whereClause}
            ORDER BY ${orderBy} ${order}
        LIMIT ?
            OFFSET ?
        `;

        const [rows] = await this.pool.execute(query, [...values, limit, offset]);
        return rows.map(row => this._createModel(row));
    }

    async create(data) {
        const model = new this.ModelClass(data);
        const modelData = model.toJSON();

        const keys = Object.keys(modelData);
        const values = Object.values(modelData);
        const placeholders = keys.map(() => '?').join(', ');

        const query = `
            INSERT INTO ${this.tableName} (${keys.join(', ')})
            VALUES (${placeholders})
        `;

        const [result] = await this.pool.execute(query, values);
        return this.findById(result.insertId);
    }

    async update(id, data) {
        const model = new this.ModelClass(data);
        const modelData = model.toJSON();

        delete modelData.id;

        if (Object.keys(modelData).length === 0) {
            return this.findById(id);
        }

        const setClause = Object.keys(modelData)
            .map(key => `${key} = ?`)
            .join(', ');
        const values = Object.values(modelData);

        const query = `
            UPDATE ${this.tableName}
            SET ${setClause}
            WHERE id = ?
        `;

        await this.pool.execute(query, [...values, id]);
        return this.findById(id);
    }

    async delete(id) {
        const query = `DELETE
                       FROM ${this.tableName}
                       WHERE id = ?`;
        const [result] = await this.pool.execute(query, [id]);
        return result.affectedRows > 0;
    }
}

module.exports = BaseDAO;