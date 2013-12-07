define [
  'config'
  'angular'
  'controller/header/header-menu-controller'
], (cfg, A) ->
  class HeaderController
    constructor: (@$scope) ->
      @init()

    init: () ->
      @addPartials()

    addPartials: () ->
      @$scope.menuPartial = cfg.path.partial + 'header/header-menu-partial.html'

  app = A.module cfg.ngApp
  app.controller 'headerController', HeaderController
