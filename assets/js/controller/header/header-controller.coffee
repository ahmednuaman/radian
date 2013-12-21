define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  # Jump to [`controller/header/header-menu-controller.coffee`](header-menu-controller.html) ☛
  'controller/header/header-menu-controller'
], (cfg, A) ->
  class HeaderController
    @$inject = [
      '$scope'
    ]

    constructor: (@$scope) ->
      @init()

    init: () ->
      @addPartials()

    addPartials: () ->
      @$scope.menuPartial = cfg.path.partial + 'header/header-menu-partial.html'

  app = A.module cfg.ngApp
  app.controller 'headerController', HeaderController
