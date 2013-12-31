define [
  'config'
  'angular'
  'filter/stub-filter'
], (cfg, A) ->
  describe 'Stub filter', () ->
    $location = null
    filter = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $filter = $injector.get '$filter'
      $location = $injector.get '$location'
      filter = $filter 'stubFilter'

    it 'should run the filter', () ->
      input = 'foo'
      filtered = filter input

      expect(filtered).toBe "input #{input}, $location.path() #{$location.path()}"