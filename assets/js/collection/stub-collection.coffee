# This is a stub collection. It does nothing.
define [
  'lodash'
  'vo/stub-vo'
], (_, vo) ->
  (dfd, data) ->
    collection = _.map data, vo

    dfd.resolve collection