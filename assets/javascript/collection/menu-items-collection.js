define([
  'lodash',
  'vo/menu-item-vo'
], function(_, menuItemVO) {
  function(dfd, data) {
    var collection = _.map(data, menuItemVO);

    return dfd.resolve(collection);
  };
});