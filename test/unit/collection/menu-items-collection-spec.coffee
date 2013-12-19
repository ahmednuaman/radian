define [
  'config'
  'angular'
  'collection/menu-items-collection'
  'vo/menu-item-vo'
], (cfg, A, collection, vo) ->
  describe 'Menu items collection', () ->
    $q = null
    $rootScope = null

    beforeEach inject ($injector) ->
      $q = $injector.get '$q'
      $rootScope = $injector.get '$rootScope'

    it 'should return a nice collection', () ->
      data =
        title: 'foo'
        href: '/bar'
      datas = [data, data, data]
      dfd = $q.defer()
      cb =
        success: (VOs) ->
          expect(VOs.length).toBe datas.length

      dfd.promise.then cb.success
      collection dfd, datas

      $rootScope.$digest()