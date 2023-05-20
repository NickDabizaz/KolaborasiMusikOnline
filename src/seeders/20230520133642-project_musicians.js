const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const projectMusiciansData = [];

    // Generate data for 10 project musicians
    for (let i = 0; i < 10; i++) {
      const projectMusician = {
        project_musician_id: faker.string.alphaNumeric(5),
        music_project_id: faker.string.alphaNumeric(5),
        user_id: faker.string.alphaNumeric(5),
        created_at: new Date(),
        updated_at: new Date(),
      };

      projectMusiciansData.push(projectMusician);
    }

    await queryInterface.bulkInsert('Project_Musicians', projectMusiciansData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Project_Musicians', null, {});
  }
};
