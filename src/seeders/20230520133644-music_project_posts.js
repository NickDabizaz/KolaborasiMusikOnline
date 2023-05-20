const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const musicProjectPostsData = [];

    // Generate data for 10 music project posts
    for (let i = 0; i < 10; i++) {
      const musicProjectPost = {
        music_project_post_id: faker.string.alphaNumeric(5),
        music_project_id: faker.string.alphaNumeric(5),
        title: faker.lorem.words(),
        description: faker.lorem.paragraph(),
        created_at: new Date(),
        updated_at: new Date(),
      };

      musicProjectPostsData.push(musicProjectPost);
    }

    await queryInterface.bulkInsert('Music_Project_Posts', musicProjectPostsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Music_Project_Posts', null, {});
  }
};
