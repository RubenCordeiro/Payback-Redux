# models/google.coffee

module.exports = (sequelize, DataTypes) ->

  Google = sequelize.define('Facebook', {
      id: { type: DataTypes.STRING, required: true },
      token: { type: DataTypes.STRING, unique: true },
      email: { type: DataTypes.STRING(254), required: true, unique: true, validate: { isEmail: true } },
      displayName: { type: DataTypes.STRING, required: true },
      avatar: { type: DataTypes.STRING, required: false, defaultValue: '' }
    },
    {
      classMethods: {
        associate: (models) ->
          Google.hasOne(models.User, { as: 'LocalUser' })
          Google.belongsTo(models.User)
      }
    })

  return Google
