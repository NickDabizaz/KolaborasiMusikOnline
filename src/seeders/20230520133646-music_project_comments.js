const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const musicProjectCommentsData = [];

    // Generate data for 10 music project comments
    for (let i = 0; i < 10; i++) {
      const musicProjectComment = {
        music_project_comment_id: faker.string.alphaNumeric(5),
        music_project_post_id: faker.string.alphaNumeric(5),
        commenter_id: faker.string.alphaNumeric(5),
        comment: faker.lorem.sentence(),
        created_at: new Date(),
        updated_at: new Date(),
      };

      musicProjectCommentsData.push(musicProjectComment);
    }

    await queryInterface.bulkInsert('Music_Project_Comments', musicProjectCommentsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Music_Project_Comments', null, {});
  }
};
