define [
  'config'
  'angular'
  'factory/page-error-factory'
], (cfg, A) ->
  describe 'Page error factory', () ->
    $location = null
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $location = $injector.get '$location'
      factory = $injector.get 'pageErrorFactory'

    it 'should change the $location according to an error code', () ->
      factory.show500()

      expect($location.path()).toBe '/error/500'

      factory.showError(404)

      expect($location.path()).toBe '/error/404'