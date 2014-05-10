define [
  'config'
  'angular'
  'factory/page-loader-factory'
], (cfg, A) ->
  describe 'Page loader factory', () ->
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      factory = $injector.get 'pageLoaderFactory'

    it 'should $emit an event that says whether to hide or show the loader', (done) ->
      showing = true
      cb =
        handleLoader: (event, show) ->
          expect(show).toBe showing

      factory.addListener cb.handleLoader
      factory.show()

      setTimeout () ->
        showing = false
        factory.hide()

        done()

      , 250
