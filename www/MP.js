var exec = require('cordova/exec');

exports.createToken = function(publicKey, cardNumber, expirationMonth, expirationYear, securityCode, cardholdername, docType, docNumber, successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'MP', 'createToken', [publicKey, cardNumber, expirationMonth, expirationYear, securityCode, cardholdername, docType, docNumber]);
};
