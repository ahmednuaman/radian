define [
  'config'
  'angular'
  'directive/menu-component-directive'
  'service/menu-service'
], (cfg, A) ->
  class HeaderMenuController
    @$inject = [
      '$scope'
      'menuService'
    ]

    constructor: (@$scope, @menuService) ->
      @init()

    init: () ->
      @loadMenu()

    loadMenu: () ->
      success = A.bind @, @handleLoadMenuSuccess
      failure = A.bind @, @handleLoadMenuFailure

      @menuService.get().then success, failure

    handleLoadMenuSuccess: () ->


    handleLoadMenuFailure: () ->


  app = A.module cfg.ngApp
  app.controller 'headerMenuController', HeaderMenuController
