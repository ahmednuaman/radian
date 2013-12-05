define [
  'config'
  'angular'
], (cfg, A) ->
  class HomeController
    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'homeController', HomeController
