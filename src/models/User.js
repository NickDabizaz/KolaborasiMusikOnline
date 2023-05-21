'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      User.hasMany(models.Project, {
        foreignKey: 'producer_id'
      });
      User.belongsToMany(models.Project, {
        through: models.Comment,
        foreignKey: 'commenter_id',
        as: 'comments'
      });
      User.belongsToMany(models.Project, {
        through: models.ProjectMember,
        foreignKey: 'musician_id',
        as: 'projects'
      });
      User.hasMany(models.Recording, {
        foreignKey: 'musician_id'
      });
    }
    
  }

  User.init(
    {
      user_id: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false,
      },
      username: {
        type: DataTypes.STRING,
      },
      password: {
        type: DataTypes.STRING,
      },
      email: {
        type: DataTypes.STRING,
      },
      role: {
        type: DataTypes.STRING,
      },
      balance: {
        type: DataTypes.INTEGER,
      },
      api_hit: {
        type: DataTypes.INTEGER,
      },
    },
    {
      sequelize,
      modelName: 'User',
      tableName: 'Users',
      timestamps: true,
    }
  );

  return User;
};
