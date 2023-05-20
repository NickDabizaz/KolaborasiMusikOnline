'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Recordings', {
      recording_id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      project_id: {
        type: Sequelize.STRING
      },
      file_path: {
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
    await queryInterface.dropTable('Recordings');
  }
};