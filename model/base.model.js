class BaseModel {
    constructor(data = {}) {
        this.commonFields = ['id', 'created_at', 'updated_at'];

        this.fields = [];
    }

    getAllowedFields() {
        return [...this.commonFields, ...this.fields];
    }

    setData(data) {
        const allowedFields = this.getAllowedFields();
        for (const field of allowedFields) {
            if (field in data) {
                this[field] = data[field];
            }
        }
    }

    toJSON() {
        const result = {};
        const allowedFields = this.getAllowedFields();

        for (const field of allowedFields) {
            if (this[field] !== undefined) {
                result[field] = this[field];
            }
        }

        return result;
    }
}

module.exports = BaseModel;