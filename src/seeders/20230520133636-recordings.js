const faker = require('@faker-js/faker');

'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const recordingsData = [];

    // Generate data for 10 recordings
    for (let i = 0; i < 10; i++) {
      const recording = {
        recording_id: faker.string.alphaNumeric(5),
        project_id: faker.string.alphaNumeric(5),
        file_path: faker.system.filePath(),
        createdAt: new Date(),
        updatedAt: new Date(),
      };

      recordingsData.push(recording);
    }

    await queryInterface.bulkInsert('Recordings', recordingsData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Recordings', null, {});
  }
};
