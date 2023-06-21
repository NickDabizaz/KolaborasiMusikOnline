'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ProjectMember extends Model {
    static associate(models) {
      ProjectMember.belongsTo(models.Project, {
        foreignKey: 'project_id',
        as: 'project'
      });
      ProjectMember.belongsTo(models.User, {
        foreignKey: 'musician_id',
        as: 'musician'
      });
    }
    
  }
  ProjectMember.init({
    project_member_id: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false
    },
    project_id: {
      type: DataTypes.STRING
    },
    musician_id: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'ProjectMember',
    tableName: 'project_Members',
    timestamps: true
  });
  return ProjectMember;
};
