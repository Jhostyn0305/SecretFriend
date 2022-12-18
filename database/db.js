const initOptions = {};

const pgp = require('pg-promise')(initOptions);

const db = pgp('postgres://postgres:2280998jG@localhost:5432/SecretFriend');

module.exports = db;