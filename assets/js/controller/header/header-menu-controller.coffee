define [
  'config'
  'angular'
  'directive/menu-component-directive'
  'factory/menu-factory'
  'factory/page-error-factory'
  'service/menu-service'
], (cfg, A) ->
  class HeaderMenuController
    @$inject = [
      '$scope'
      'menuFactory'
      'menuService'
      'pageErrorFactory'
    ]

    constructor: (@$scope, @menuFactory, @menuService, @pageErrorFactory) ->
      @init()

    init: () ->
      @loadMenu()

    loadMenu: () ->
      success = A.bind @, @handleLoadMenuSuccess
      failure = A.bind @, @handleLoadMenuFailure

      @menuService.get().then success, failure

    handleLoadMenuSuccess: () ->
      @$scope.menuItems = @menuFactory.get()

    handleLoadMenuFailure: () ->
      @pageErrorFactory.show500()

  app = A.module cfg.ngApp
  app.controller 'headerMenuController', HeaderMenuController
