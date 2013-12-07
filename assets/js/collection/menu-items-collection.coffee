define [
  'lodash'
  'vo/menu-item-vo'
], (_, menuItemVO) ->
  (dfd, data) ->
    collection = _.map data, menuItemVO

    dfd.resolve(collection)