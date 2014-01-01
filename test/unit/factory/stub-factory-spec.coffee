define [
  'config'
  'angular'
  'factory/stub-factory'
], (cfg, A) ->
  describe 'Stub factory', () ->
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      factory = $injector.get 'stubFactory'

    it 'should load', () ->
      expect(factory.publicMethod).toBeDefined()