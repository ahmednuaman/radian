# This is a stub controller. It does nothing.
define [
  'config'
  'angular'
], (cfg, A) ->
  class StubController
    @$inject = [
      '$scope'
    ]

    constructor: (@$scope) ->
      @init()

    init: () ->

  app = A.module cfg.ngApp
  app.controller 'stubController', StubController
