const { Sequelize } = require("sequelize");

require("dotenv").config();

// Define the database connection
const sequelize = new Sequelize(
  process.env.DEV_DB_NAME, // database name
  process.env.DEV_DB_USER, // database username
  process.env.DEV_DB_PASS, // database password
  {
    host: process.env.DEV_DB_HOST, // database host
    port: process.env.DEV_DB_PORT, // database port
    dialect: process.env.DEV_DB_DIALECT, // database dialect
  }
);

// Test the database connection
async function testConnection() {
  try {
    await sequelize.authenticate();
    console.log("Database connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
}

testConnection();

module.exports = sequelize;
