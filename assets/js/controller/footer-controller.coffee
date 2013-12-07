define [
  'config'
  'angular'
], (cfg, A) ->
  class FooterController
    @$inject = [
      '$scope'
    ]

    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'footerController', FooterController
