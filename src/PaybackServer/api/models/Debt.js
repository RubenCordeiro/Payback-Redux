/**
* Debt.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {
      description: {
          type: 'string',
          required: false,
          defaultsTo: '',
          maxLength: 100
      },
      originalValue: {
          type: 'float',
          required: true
      },
      value: {
          type: 'float',
          required: true,
          min: 0
      },
      currency: {
          type: 'string',
          required: true,
          enum: [
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
      }
  }
};

