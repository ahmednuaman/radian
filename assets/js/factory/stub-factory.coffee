# This is a stub factory. It does nothing.
define [
  'config'
  'angular'
], (cfg, A) ->
  stubFactory = ($rootScope) ->
    privateMethod = () ->

    factory =
      publicMethod: () ->

  stubFactory.$inject = [
    '$rootScope'
  ]

  app = A.module cfg.ngApp
  app.factory 'stubFactory', stubFactory
