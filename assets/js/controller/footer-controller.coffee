define [
  'config'
  'angular'
], (cfg, A) ->
  class FooterController
    constructor: (@$scope) ->

  app = A.module cfg.ngApp
  app.controller 'footerController', FooterController
