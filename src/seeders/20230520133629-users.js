'use strict';

const faker = require('@faker-js/faker');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const usersData = [];

    // Generate 10 fake users
    for (let i = 0; i < 10; i++) {
      const user = {
        user_id: faker.string.alphanumeric(5),
        username: faker.internet.userName(),
        password: faker.internet.password(),
        email: faker.internet.email(),
        role: faker.random.arrayElement(['member', 'musician', 'producer']),
        balance: faker.random.int({ min: 1000, max: 100000}),
        createdAt: new Date(),
        updatedAt: new Date(),
      };

      usersData.push(user);
    }

    await queryInterface.bulkInsert('Users', usersData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Users', null, {});
  }
};
