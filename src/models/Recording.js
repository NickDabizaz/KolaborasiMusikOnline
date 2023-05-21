'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Recording extends Model {
    static associate(models) {
      Recording.belongsTo(models.Project, {
        foreignKey: 'project_id',
        as: 'project'
      });
      Recording.belongsTo(models.User, {
        foreignKey: 'musician_id',
        as: 'musician'
      });
    }
    
  }
  Recording.init({
    recording_id: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false
    },
    project_id: {
      type: DataTypes.STRING,
      allowNull: false
    },
    musician_id: {
      type: DataTypes.STRING,
      allowNull: false
    },
    file_path: {
      type: DataTypes.STRING
    }
  }, {
    sequelize,
    modelName: 'Recording',
    tableName: 'Recordings',
    timestamps: true
  });
  return Recording;
};
