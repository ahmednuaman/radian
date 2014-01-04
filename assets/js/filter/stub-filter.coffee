# This is a stub filter. It does nothing.
define [
  # Load up the base filter, all controllers inherit from it. All hail the base filter. Such meta.
  # Jump to [`filter/radian-filter.coffee`](radian-filter.html) ☛
  'filter/radian-filter'
], (RF) ->
  RF 'stubFilter', [
    '$location'
  ], ($location) ->
    (input) ->
      "input #{input}, $location.path() #{$location.path()}"