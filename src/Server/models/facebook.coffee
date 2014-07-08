# models/facebook.coffee

module.exports = (sequelize, DataTypes) ->

  Facebook = sequelize.define('Facebook', {
    id: { type: DataTypes.STRING, required: true },
    token: { type: DataTypes.STRING, required: true, unique: true },
    email: { type: DataTypes.STRING(254), required: true, unique: true, validate: { isEmail: true } },
    displayName: { type: DataTypes.STRING, required: true },
    avatar: { type: DataTypes.STRING, required: false, defaultValue: '' }
  },
    {
      classMethods: {
        associate: (models) ->
          Facebook.hasOne(models.User, { as: 'LocalUser' })
          Facebook.belongsTo(models.User)
      }
    })

  return Facebook
