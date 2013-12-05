define [
  'config'
  'angular'
], (cfg, A) ->
  class HeaderController
    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'headerController', HeaderController
