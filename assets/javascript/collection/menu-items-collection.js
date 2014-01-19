define([
  'lodash',
  'vo/menu-item-vo'
], function(_, menuItemVO) {
  return function(dfd, data) {
    var collection = _.map(data, menuItemVO);

    return dfd.resolve(collection);
  };
});