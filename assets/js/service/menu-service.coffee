define [
  'config'
  'angular'
  'factory/menu-factory'
], (cfg, A) ->
  class MenuService
    @$inject = [
      '$q'
      '$resource'
      'menuFactory'
    ]

    constructor: (@$q, @$resource, @menuFactory) ->
      @menu = @$resource '/data/menu.json'

    get: () ->
      dfd = @$q.defer()
      success = A.bind @, @handleSuccess, dfd
      failure = A.bind @, @handleFailure, dfd

      @menu.get().$promise.then success, failure

      dfd.promise

    handleSuccess: (dfd, menu) ->
      @menuFactory.set dfd, menu.items

    handleFailure: (dfd) ->
      dfd.reject()

  app = A.module cfg.ngApp
  app.service 'menuService', MenuService
