'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Recording extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Recording.init({
    recording_id: DataTypes.STRING,
    project_id: DataTypes.STRING,
    file_path: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Recording',
  });
  return Recording;
};