define([
  'lodash'
], function(_) {
  return function(data) {
    return _.assign(data, {
      selected: false,
      target: data['target']
    });
  };
});