define([
  'lodash'
], function(_) {
  function(data) {
    return _.assign(data, {
      aParam: true
    });
  };
});