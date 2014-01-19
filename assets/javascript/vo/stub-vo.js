define([
  'lodash'
], function(_) {
  return function(data) {
    return _.assign(data, {
      aParam: true
    });
  };
});