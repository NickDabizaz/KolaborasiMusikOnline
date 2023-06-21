"use strict";

const { faker } = require("@faker-js/faker");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const projects = [];

    // Generate 10 projects
    for (let i = 0; i < 10; i++) {
      let projectId = `P${(i + 1).toString().padStart(3, "0")}`;
      let title = faker.lorem.words(3);
      let description = faker.lorem.sentence();
      let producerId = `UID${(i + 1).toString().padStart(3, "0")}`;
      let createdAt = new Date();
      let updatedAt = new Date();

      projects.push({
        project_id: projectId,
        title: title,
        description: description,
        producer_id: producerId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      });
    }

    // Insert projects into the Projects table
    await queryInterface.bulkInsert("Projects", projects, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the Projects table
    await queryInterface.bulkDelete("Projects", null, {});
  },
};
