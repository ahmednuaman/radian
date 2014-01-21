define([
  'factory/radian-factory'
], function(RF) {
  RF('stubFactory', [
    '$rootScope'
  ], function($rootScope) {
    var factory,
        privateMethod;

    privateMethod = function() {

    };

    factory = {
      publicMethod: function() {

      }
    };

    return factory;
  });
});