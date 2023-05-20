'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class MusicProjectPost extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  MusicProjectPost.init({
    music_project_post_id: DataTypes.STRING,
    music_project_id: DataTypes.STRING,
    title: DataTypes.STRING,
    description: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'MusicProjectPost',
  });
  return MusicProjectPost;
};