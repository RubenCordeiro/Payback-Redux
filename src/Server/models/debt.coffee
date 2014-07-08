# models/debt.coffee
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
  Debt = sequelize.define('Debt', {
    description: { type: DataTypes.STRING, required: false, defaultValue: "", validate: { max: 100 }},
    originalValue: { type: DataTypes.FLOAT, required: true },
    value: { type: DataTypes.FLOAT, required: true, validate: { min: 0 } },
    currency: { type: DataTypes.STRING, required: true, validate: { isIn: [validCurrencies]} }
  },
    {
      classMethods: {
        associate: (models) ->
          Debt
          .hasOne(models.User, {as: 'Creditor'})
          .hasOne(models.User, {as: 'Debtor'})
      }
    })
  return Debt