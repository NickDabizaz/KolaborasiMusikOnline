'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Project extends Model {
    static associate(models) {
      Project.belongsTo(models.User, {
        foreignKey: 'producer_id',
        as: 'producer'
      });
      Project.belongsToMany(models.User, {
        through: models.ProjectMember,
        foreignKey: 'project_id',
        as: 'members'
      });
      Project.hasMany(models.Recording, {
        foreignKey: 'project_id'
      });
      Project.belongsToMany(models.User, {
        through: models.Comment,
        foreignKey: 'project_id',
        as: 'comments'
      });
    }
    
    
  }
  Project.init({
    project_id: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false
    },
    title: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.STRING
    },
    producer_id: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Project',
    tableName: 'Projects',
    timestamps: true
  });
  return Project;
};
