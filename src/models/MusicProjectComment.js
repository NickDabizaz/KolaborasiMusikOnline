'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class MusicProjectComment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  MusicProjectComment.init({
    music_project_comment_id: DataTypes.STRING,
    music_project_post_id: DataTypes.STRING,
    commenter_id: DataTypes.STRING,
    comment: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'MusicProjectComment',
  });
  return MusicProjectComment;
};