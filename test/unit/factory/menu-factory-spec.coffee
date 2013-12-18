define [
  'config'
  'angular'
  'factory/menu-factory'
], (cfg, A) ->
  describe 'Menu factory', () ->
    $q = null
    $rootScope = null
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $q = $injector.get '$q'
      $rootScope = $injector.get '$rootScope'
      factory = $injector.get 'menuFactory'

    data = [
      title: '1'
      href: '/1'
    ,
      title: '2'
      href: '/2'
    ,
      title: '3'
      href: '/3'
    ,
      title: '4'
      href: '/4'
    ]

    it 'should populate the factory', () ->
      dfd = $q.defer()

      dfd.promise.then () ->
        expect(factory.collection.length).toBe data.length

      factory.set dfd, data

      $rootScope.$digest()