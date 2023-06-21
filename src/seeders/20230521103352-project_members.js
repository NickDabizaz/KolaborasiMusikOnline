"use strict";

const { faker } = require("@faker-js/faker");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const projectMembers = [];

    // Generate project members
    for (let i = 0; i < 10; i++) {
      let memberId = `M${(i + 1).toString().padStart(3, "0")}`;
      let musicianId = `UID${(i + 1).toString().padStart(3, "0")}`
      let projectId = `P${(i + 1).toString().padStart(3, "0")}`
      let createdAt = new Date();
      let updatedAt = new Date();

      projectMembers.push({
        project_member_id: memberId,
        project_id: projectId,
        musician_id: musicianId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      });
    }

    // Insert project members into the ProjectMembers table
    await queryInterface.bulkInsert("Project_Members", projectMembers, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the ProjectMembers table
    await queryInterface.bulkDelete("Project_Members", null, {});
  },
};
