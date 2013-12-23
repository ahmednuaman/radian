# This is a stub service. It does nothing.
define [
  'config'
  'angular'
], (cfg, A) ->
  class StubService
    @$inject = [
      '$q'
      '$resource'
    ]

    constructor: (@$q, @$resource) ->
      @init()

    init: () ->
      @fooBar = @$resource '/foo/bar.json'

  app = A.module cfg.ngApp
  app.service 'stubService', StubService
