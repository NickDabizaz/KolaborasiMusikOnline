const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const projectsData = [];

    // Generate data for 10 projects
    for (let i = 0; i < 10; i++) {
      const project = {
        project_id: faker.string.alphaNumeric(5),
        title: faker.lorem.words(),
        description: faker.lorem.sentence(),
        user_id: faker.string.alphaNumeric(5),
        createdAt: new Date(),
        updatedAt: new Date(),
      };

      projectsData.push(project);
    }

    await queryInterface.bulkInsert('Projects', projectsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Projects', null, {});
  }
};
