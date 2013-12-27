define [
  'config'
  'angular'
  'service/stub-service'
], (cfg, A) ->
  describe 'Stub service', () ->
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      service = $injector.get 'menuService'

    it 'should load', () ->
      expect(service.fooBar).toBeDefined()