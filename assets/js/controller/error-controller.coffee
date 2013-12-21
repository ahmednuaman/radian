define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
], (cfg, A) ->
  class ErrorController
    @$inject = [
      '$scope'
      '$routeParams'
    ]

    constructor: (@$scope, @$routeParams) ->
      @init()

    init: () ->
      @$scope.code = @$routeParams.code || '404'

  app = A.module cfg.ngApp
  app.controller 'errorController', ErrorController
