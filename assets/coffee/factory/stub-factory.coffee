# This is a stub factory. It does nothing.
define [
  # Load up the base factory, all controllers inherit from it. All hail the base factory. Such meta.
  # Jump to [`factory/radian-factory.coffee`](radian-factory.html) ☛
  'factory/radian-factory'
], (RF) ->
  RF 'stubFactory', [
    '$rootScope'
  ], ($rootScope) ->
    privateMethod = () ->

    factory =
      publicMethod: () ->