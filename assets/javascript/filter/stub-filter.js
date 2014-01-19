define([
  'filter/radian-filter'
], function(RF) {
  RF('stub', [
    '$location'
  ], function($location) {
    return function(input) {
      return 'input ' + input + ', $location.path() ' + $location.path();
    };
  });
});