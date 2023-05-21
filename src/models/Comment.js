'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Comment extends Model {
    static associate(models) {
      Comment.belongsTo(models.Project, {
        foreignKey: 'project_id',
        as: 'project'
      });
      Comment.belongsTo(models.User, {
        foreignKey: 'commenter_id',
        as: 'commenter'
      });
    }
    
  }
  Comment.init({
    comment_id: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false
    },
    project_id: {
      type: DataTypes.STRING,
      allowNull: false
    },
    commenter_id: {
      type: DataTypes.STRING,
      allowNull: false
    },
    comment: {
      type: DataTypes.STRING
    }
  }, {
    sequelize,
    modelName: 'Comment',
    tableName: 'Comments',
    timestamps: true
  });
  return Comment;
};
