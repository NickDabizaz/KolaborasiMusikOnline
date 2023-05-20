const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const musicProjectsData = [];

    // Generate data for 10 music projects
    for (let i = 0; i < 10; i++) {
      const musicProject = {
        music_project_id: faker.string.alphaNumeric(5),
        title: faker.lorem.words(3),
        description: faker.lorem.sentence(),
        user_id: faker.string.alphaNumeric(5),
        created_at: new Date(),
        updated_at: new Date(),
      };

      musicProjectsData.push(musicProject);
    }

    await queryInterface.bulkInsert('Music_Projects', musicProjectsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Music_Projects', null, {});
  }
};
