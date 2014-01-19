define([
  'lodash'
], function(_) {
  function(data) {
    return _.assign(data, {
      selected: false,
      target: data['target']
    });
  };
});