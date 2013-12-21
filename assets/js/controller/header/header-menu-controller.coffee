# This is a slighty more complex controller. If mediates the loading of the menu data for the view and deals with error
# handling; eg if the menu fails to load it then notifies the application to throw a 500 error. It's also important to
# remember that since [RequireJS](http://requirejs.org) is being used to load only the dependancies of this document,
# this means that should a requirement change and a controller is removed, then all its dependancies aren't packaged
# up with the app during the build process; no dead code.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  # Jump to [`directive/menu-component-directive.coffee`](menu-component-directive.html) ☛
  'directive/menu-component-directive'
  # Jump to [`factory/menu-factory.coffee`](menu-factory.html) ☛
  'factory/menu-factory'
  # Jump to [`factory/page-error-factory.coffee`](page-error-factory.html) ☛
  'factory/page-error-factory'
  # Jump to [`service/menu-service.coffee`](menu-service.html) ☛
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
      # Simple deferred promise structure using [`$q`](http://docs.angularjs.org/api/ng.$q).
      success = A.bind @, @handleLoadMenuSuccess
      failure = A.bind @, @handleLoadMenuFailure

      # Jump to [`service/menu-service.coffee`](menu-service.html) ☛
      @menuService.get().then success, failure

    handleLoadMenuSuccess: () ->
      # Jump to [`factory/menu-factory.coffee`](menu-factory.html) ☛
      @$scope.menuItems = @menuFactory.get()

    handleLoadMenuFailure: () ->
      # Making use of another factory to deal with throwing errors should any problems occur.
      # Jump to [`factory/page-error-factory.coffee`](page-error-factory.html) ☛
      @pageErrorFactory.show500()

  app = A.module cfg.ngApp
  app.controller 'headerMenuController', HeaderMenuController
