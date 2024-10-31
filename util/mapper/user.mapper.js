function userMapper(user) {
    const {password, email_verified, ...rest} = user;
    return rest;
}

module.exports = userMapper;