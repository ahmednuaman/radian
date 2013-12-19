define [
  'config'
  'angular'
  'factory/menu-factory'
  'service/menu-service'
], (cfg, A) ->
  describe 'Menu service', () ->
    $httpBackend = null
    factory = null
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $httpBackend = $injector.get '$httpBackend'
      factory = $injector.get 'menuFactory'
      service = $injector.get 'menuService'

    it 'should get the menu and populate the factory', () ->
      data = [
        title: '1'
        href: '/'
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

      $httpBackend.expect 'GET', '/data/menu.json', JSON.stringify data

      service.get().then () ->
        expect(factory.get().length).toBe(data.length)

        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()