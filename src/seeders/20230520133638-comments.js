const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const commentsData = [];

    // Generate data for 10 comments
    for (let i = 0; i < 10; i++) {
      const comment = {
        comment_id: faker.string.alphaNumeric(5),
        project_id: faker.string.alphaNumeric(5),
        commenter_id: faker.string.alphaNumeric(5),
        comment: faker.lorem.sentence(),
        createdAt: new Date(),
        updatedAt: new Date(),
      };

      commentsData.push(comment);
    }

    await queryInterface.bulkInsert('Comments', commentsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Comments', null, {});
  }
};
