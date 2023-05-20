'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    
    static associate(models) {
      // define association here
    }
  }
  User.init({
    user_id: DataTypes.STRING,
    username: DataTypes.STRING,
    password: DataTypes.STRING,
    email: DataTypes.STRING,
    role: DataTypes.STRING,
    balance: DataTypes.DECIMAL
  }, {
    sequelize,
    modelName: 'User',
  });
  return User;
};