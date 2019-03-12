const pg = require("pg");
const pool = new pg.Pool({
user: "James",
host: "localhost",
database: 'makersBnb',
password: "",
port: "5432"});

pool.query('SELECT * FROM listings WHERE id=1', (err, res) => {
console.log(res)
pool.end();
});
