define([
  'filter/radian-filter'
], function(RF) {
  RF('stub', [
    '$location'
  ], function($location) {
    function(input) {
      return 'input ' + input + ', $location.path() ' + $location.path();
    };
  });
});