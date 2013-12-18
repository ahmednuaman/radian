define [
  'config'
  'angular'
  'factory/page-title-factory'
], (cfg, A) ->
  describe 'Page title factory', () ->
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      factory = $injector.get 'pageTitleFactory'

    it 'should $emit an event that contains a new title', () ->
      title = 'foo'

      factory.addListener (event, newTitle) ->
        expect(newTitle).toBe title

      factory.setTitle title