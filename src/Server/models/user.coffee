# models/user.coffee
validCurrencies = [
  "AUD", "BGN", "BRL", "CAD",
  "CHF", "CNY", "CZK", "DKK",
  "EUR", "GBP", "HKD", "HRK",
  "HUF", "IDR", "ILS", "INR",
  "JPY", "KRW", "LTL", "MXN",
  "MYR", "NOK", "NZD", "PHP",
  "PLN", "RON", "RUB", "SEK",
  "SGD", "THB", "TRY", "USD",
  "ZAR"
]

module.exports = (sequelize, DataTypes) ->

  User = sequelize.define('User', {
    id: { type: DataTypes.STRING, primaryKey: true },
    passwordHash: { type: DataTypes.STRING(64)},
    email: { type: DataTypes.STRING(254), required: false, unique: true },
    currency: { type: DataTypes.STRING(3), required: false, defaultValue: 'EUR', validate: { isIn: [validCurrencies] } },
    avatar: { type: DataTypes.STRING, required: false, defaultValue: '', validate: { isEmail: true } }
  },
    {
      classMethods: {
        associate: () ->
          User.hasMany(User, { as: 'Friends' })
      }
    })

  return User
