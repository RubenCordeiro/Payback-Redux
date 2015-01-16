/**
* User.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {
      name: {
          type: 'string',
          primaryKey: true
      },
      password: {
          type: 'string',
          required: true,
          minLength: 64,
          maxLength: 64
      },
      email: {
          type: 'string',
          email: true,
          required: false,
          unique: true
      },
      avatar: {
          type: 'string',
          required: false,
          defaultsTo: ''
      },
      currency: {
          type: 'string',
          maxLength: 3,
          required: false,
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
          ],
          defaultsTo: 'EUR'
      }
  }
};

