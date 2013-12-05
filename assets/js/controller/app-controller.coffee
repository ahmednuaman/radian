define [
  'config'
  'angular'
  'routes'
  'controller/header/header-controller'
], (cfg, A) ->
  class AppController
    constructor: (@$scope) ->
      @init()

    init: () ->
      @addPartials()

    addPartials: () ->
      @$scope.headerPartial = cfg.path.partial + 'header/header-partial.html'

  app = A.module cfg.ngApp
  app.controller 'appController', AppController
