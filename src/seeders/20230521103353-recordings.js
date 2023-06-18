"use strict";

const { faker } = require("@faker-js/faker");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const recordings = [];

    // Generate recordings
    for (let i = 0; i < 20; i++) {
      let recordingId = `R${(i + 1).toString().padStart(3, "0")}`;
      let projectId = `P${(i + 1).toString().padStart(3, "0")}`;
      let musicianId = `UID${(i + 1).toString().padStart(3, "0")}`;
      let song_url = faker.image.url();
      let title = faker.lorem.sentence(3)
      let createdAt = new Date();
      let updatedAt = new Date();

      recordings.push({
        recording_id: recordingId,
        project_id: projectId,
        musician_id: musicianId,
        title,
        song_url,
        createdAt: createdAt,
        updatedAt: updatedAt,
      });
    }

    // Insert recordings into the Recordings table
    await queryInterface.bulkInsert("Recordings", recordings, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the Recordings table
    await queryInterface.bulkDelete("Recordings", null, {});
  },
};
