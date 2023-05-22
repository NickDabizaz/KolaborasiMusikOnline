"use strict";

const {faker} = require("@faker-js/faker");

function getRandomRole() {
  const roles = ['member', 'musician', 'producer'];
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
      let userId = i;
      let firstName = faker.person.firstName()
      let lastName = faker.person.lastName()
      let username = `${firstName}_${lastName}`
      let fullName = `${firstName} ${lastName}`
      users.push({
        user_id: userId,
        username: username,
        name: fullName,
        password: faker.internet.password(),
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
