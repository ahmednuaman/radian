# This is a stub filter. It does nothing.
define [
  'config'
  'angular'
], (cfg, A) ->
  stubFilter = ($location) ->
    (input) ->
      "input #{input}, $location.path() #{$location.path()}"

  stubFilter.$inject = [
    '$location'
  ]

  app = A.module cfg.ngApp
  app.filter 'stubFilter', stubFilter
