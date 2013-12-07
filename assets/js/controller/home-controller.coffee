define [
  'config'
  'angular'
], (cfg, A) ->
  class HomeController
    @$inject = [
      '$scope'
    ]

    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'homeController', HomeController
