define [
  'config'
  'angular'
  'routes'
], (cfg, A) ->
  class AppController
    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'appController', AppController
