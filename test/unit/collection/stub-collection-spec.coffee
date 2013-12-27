define [
  'config'
  'angular'
  'collection/stub-collection'
  'vo/stub-vo'
], (cfg, A, collection, vo) ->
  describe 'Stub collection', () ->
    $q = null
    $rootScope = null

    beforeEach inject ($injector) ->
      $q = $injector.get '$q'
      $rootScope = $injector.get '$rootScope'

    it 'should return a nice collection', () ->
      data = {}
      datas = [data, data, data]
      dfd = $q.defer()
      cb =
        success: (VOs) ->
          expect(VOs.length).toBe datas.length

      dfd.promise.then cb.success
      collection dfd, datas

      $rootScope.$digest()