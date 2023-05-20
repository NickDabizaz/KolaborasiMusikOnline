'use strict';

const fs = require('fs');
const path = require('path');
const {Sequelize,DataTypes} = require('sequelize');
const process = require('process');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.js')[env];
const db = {};
const connection = require('../database/connection');

const User = require('./User');
const Project = require('./Project');
const ProjectMember = require('./ProjectMember');
const Recording = require('./Recording');
const Comment = require('./Comment');
const MusicProject = require('./MusicProject');
const ProjectMusician = require('./ProjectMusician');
const MusicProjectPost = require('./MusicProjectPost');
const MusicProjectComment = require('./MusicProjectComment');

db.User = User(connection, DataTypes);
db.Project = Project(connection, DataTypes);
db.ProjectMember = ProjectMember(connection, DataTypes);
db.Recording = Recording(connection, DataTypes);
db.Comment = Comment(connection, DataTypes);
db.MusicProject = MusicProject(connection, DataTypes);
db.ProjectMusician = ProjectMusician(connection, DataTypes);
db.MusicProjectPost = MusicProjectPost(connection, DataTypes);
db.MusicProjectComment = MusicProjectComment(connection, DataTypes);

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

fs
  .readdirSync(__dirname)
  .filter(file => {
    return (
      file.indexOf('.') !== 0 &&
      file !== basename &&
      file.slice(-3) === '.js' &&
      file.indexOf('.test.js') === -1
    );
  })
  .forEach(file => {
    const model = require(path.join(__dirname, file))(sequelize, Sequelize.DataTypes);
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;

module.exports = db;
