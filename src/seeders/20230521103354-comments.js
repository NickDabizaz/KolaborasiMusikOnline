"use strict";

const { faker } = require("@faker-js/faker");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const comments = [];

    // Generate comments
    for (let i = 0; i < 20; i++) {
      let commentId = `C${(i + 1).toString().padStart(3, "0")}`;
      let projectId = `P${(i + 1).toString().padStart(3, "0")}`;
      let commenterId = `UID${(i + 1).toString().padStart(3, "0")}`;
      let commentText = faker.lorem.sentence();
      let createdAt = new Date();
      let updatedAt = new Date();

      comments.push({
        comment_id: commentId,
        project_id: projectId,
        commenter_id: commenterId,
        comment: commentText,
        createdAt: createdAt,
        updatedAt: updatedAt,
      });
    }

    // Insert comments into the Comments table
    await queryInterface.bulkInsert("Comments", comments, {});
  },

  down: async (queryInterface, Sequelize) => {
    // Delete all records from the Comments table
    await queryInterface.bulkDelete("Comments", null, {});
  },
};
