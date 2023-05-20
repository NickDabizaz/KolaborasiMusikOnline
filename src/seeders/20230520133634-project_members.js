const faker = require('@faker-js/faker');
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const projectMembersData = [];

    // Generate data for 10 project members
    for (let i = 0; i < 10; i++) {
      const projectMember = {
        project_member_id: faker.string.alphaNumeric(5),
        project_id: faker.string.alphaNumeric(5),
        user_id: faker.string.alphaNumeric(5),
        createdAt: new Date(),
        updatedAt: new Date(),
      };

      projectMembersData.push(projectMember);
    }

    await queryInterface.bulkInsert('Project_Members', projectMembersData, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Project_Members', null, {});
  }
};
