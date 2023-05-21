'use strict';

const faker = require('@faker-js/faker');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const users = [];

    // Generate 10 users
    for (let i = 0; i < 10; i++) {
      const userId = faker.string.alpha(10);
      users.push({
        user_id: userId,
        username: faker.internet.userName(),
        password: faker.internet.password(),
        email: faker.internet.email(),
        role: faker.random.arrayElement(['admin', 'member']),
        balance: faker.random.number(),
        api_hit: faker.random.number(),
        createdAt: new Date(),
        updatedAt: new Date()
      });
    }

    // Insert users into the Users table
    await queryInterface.bulkInsert('Users', users, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the Users table
    await queryInterface.bulkDelete('Users', null, {});
  }
};
