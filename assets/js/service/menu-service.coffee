# This service is used by the [`controller/header/header-menu-controller.coffee`](header-menu-controller.html) to load
# the menu data from the API. It makes use of [`ngResource`](http://docs.angularjs.org/api/ngResource.$resource) and
# this in turn makes it easier to deal with [RESTful](http://en.wikipedia.org/wiki/Representational_state_transfer)
# APIs.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  # Jump to [`factory/menu-factory.coffee`](menu-factory.html) ☛
  'factory/menu-factory'
], (cfg, A) ->
  class MenuService
    @$inject = [
      '$q'
      '$resource'
      'menuFactory'
    ]

    constructor: (@$q, @$resource, @menuFactory) ->
      @init()

    init: () ->
      # The `$resource` object is defined here and this is then used to make the calls
      @menu = @$resource '/data/menu.json'

    get: () ->
      dfd = @$q.defer()
      success = A.bind @, @handleSuccess, dfd
      failure = A.bind @, @handleFailure, dfd

      @menu.get().$promise.then success, failure

      # Rather than passing the `menu`'s promise back to the controller, a new deferred object is created as this is
      # then passed to the `menuFactory` and resolved once the `collection` and `VOs` are ready.
      dfd.promise

    handleSuccess: (dfd, menu) ->
      @menuFactory.set dfd, menu.items

    handleFailure: (dfd) ->
      dfd.reject()

  app = A.module cfg.ngApp
  app.service 'menuService', MenuService
