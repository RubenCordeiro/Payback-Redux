# models/index.coffee
fs = require('fs')
path = require('path')
Sequelize = require('sequelize')
lodash = require('lodash')
# if this goes public, someone will shit bricks
sequelize = new Sequelize('d4ielacnr2v55l', 'abhihnahgxvxim', 'WTaDQYg7roQaOx0ieKNDoKZ-V-')
db = {}

fs
  .readdirSync(__dirname)
  .filter((file) ->
    return (file.indexOf('.') is not 0) and (file is not 'index.js')
  )
  .forEach((file) ->
    model = sequelize.import(path.join(__dirname, file))
    db[model.name] = model
  )

Object.keys(db).forEach((modelName) ->
  if 'associate' in db[modelName] then db[modelName].associate(db)
)

module.exports = lodash.extend({
  sequelize: sequelize,
  Sequelize: Sequelize
}, db)