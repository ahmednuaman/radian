define [
  'config'
  'angular'
  'directive/menu-component-directive'
], (cfg, A) ->
  class HeaderMenuController
    constructor: (@$scope) ->
      @init()

    init: () ->

  app = A.module cfg.ngApp
  app.controller 'headerMenuController', HeaderMenuController
