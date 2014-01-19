define([
  'lodash',
  'factory/radian-factory'
], function(_, RF) {
  RF('pageErrorFactory', [
    '$location'
  ], function($location) {
    var factory,
        redirect;

    redirect = function(code) {
      $location.path('/error/' + code);
    };

    factory = {
      showError: function(code) {
        redirect(code);
      }
    };

    _.forEach(['404', '500'], function(code) {
      factory['show' + code] = function() {
        factory.showError(code);
      };
    });

    return factory;
  });
});