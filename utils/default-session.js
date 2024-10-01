const session = require('express-session');

const sessionConfig = session({
    secret: 'thisistestsession',
    resave: false,
    saveUninitialized: false,
});

module.exports = { sessionConfig };

