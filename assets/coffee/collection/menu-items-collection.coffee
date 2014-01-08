# This collection simply maps each raw data item to a specified VO. This helps dealing with data from an API where
# local variables need to be added and/or validation checks need to be carried out to verify the validity of the data.
# At the end of the day it's just an `array`/`object`; it contains no special properties and is persisted via a factory.
define [
  'lodash'
  # Jump to [`vo/menu-item-vo.coffee`](menu-item-vo.html) ☛
  'vo/menu-item-vo'
], (_, menuItemVO) ->
  (dfd, data) ->
    collection = _.map data, menuItemVO

    dfd.resolve collection