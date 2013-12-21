define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
], (cfg, A) ->
  class HomeController
    @$inject = [
      '$scope'
    ]

    constructor: (@$scope) ->
      @init()

    init: () ->

  app = A.module cfg.ngApp
  app.controller 'homeController', HomeController
