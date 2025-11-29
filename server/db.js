const { Pool } = require('pg');

// Set up a PostgreSQL pool connection using environment variables
const pool = new Pool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    port: process.env.DB_PORT,
});

// Export the pool for use in other modules
module.exports = pool;