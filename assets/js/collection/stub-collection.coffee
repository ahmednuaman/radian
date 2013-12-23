# This is a stub collection. It does nothing.
define [
  'lodash'
  'vo/stub-vo'
], (_, stub) ->
  (dfd, data) ->
    collection = _.map data, stub

    dfd.resolve collection