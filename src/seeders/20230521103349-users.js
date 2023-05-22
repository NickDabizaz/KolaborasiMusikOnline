"use strict";

const bcrypt = require("bcrypt");
const { faker } = require("@faker-js/faker");

function getRandomRole() {
  const roles = ["member", "musician", "producer"];
  const randomIndex = Math.floor(Math.random() * roles.length);
  return roles[randomIndex];
}

function getRandomBalance() {
  const min = 1000;
  const max = 100000;
  const step = 1000;
  const randomRange = (max - min) / step + 1;
  const randomIndex = Math.floor(Math.random() * randomRange);
  return min + randomIndex * step;
}

function getRandomApiHit() {
  const min = 10;
  const max = 50;
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const users = [];

    // Generate 10 users
    for (let i = 0; i < 20; i++) {
      let userId = `UID${(i + 1).toString().padStart(3, "0")}`;
      let firstName = faker.person.firstName();
      let lastName = faker.person.lastName();
      let username = `${firstName}_${lastName}`;
      let fullName = `${firstName} ${lastName}`;
      const hashedPassword = await bcrypt.hash(fullName, 10);
      users.push({
        user_id: userId,
        username: username,
        name: fullName,
        password: hashedPassword,
        email: faker.internet.email(),
        role: getRandomRole(),
        balance: getRandomBalance(),
        api_hit: getRandomApiHit(),
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    }

    // Insert users into the Users table
    await queryInterface.bulkInsert("Users", users, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the Users table
    await queryInterface.bulkDelete("Users", null, {});
  },
};
