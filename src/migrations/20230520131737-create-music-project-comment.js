'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Music_Project_Comments', {
      music_project_comment_id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      music_project_post_id: {
        type: Sequelize.STRING
      },
      commenter_id: {
        type: Sequelize.STRING
      },
      comment: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Music_Project_Comments');
  }
};