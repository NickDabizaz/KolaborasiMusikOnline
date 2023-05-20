'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ProjectMusician extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  ProjectMusician.init({
    project_musician_id: DataTypes.STRING,
    music_project_id: DataTypes.STRING,
    user_id: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'ProjectMusician',
  });
  return ProjectMusician;
};