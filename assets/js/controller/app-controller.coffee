define [
  'config'
  'angular'
  'routes'
  'controller/header/header-controller'
  'controller/footer-controller'
], (cfg, A) ->
  class AppController
    constructor: (@$scope) ->
      @init()

    init: () ->
      @addPartials()

    addPartials: () ->
      @$scope.headerPartial = cfg.path.partial + 'header/header-partial.html'
      @$scope.footerPartial = cfg.path.partial + 'footer-partial.html'

  app = A.module cfg.ngApp
  app.controller 'appController', AppController
