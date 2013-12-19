define [
  'config'
  'angular'
  'factory/menu-factory'
  'service/menu-service'
], (cfg, A) ->
  describe 'Menu service', () ->
    $httpBackend = null
    $q = null
    $rootScope = null
    factory = null
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $httpBackend = $injector.get '$httpBackend'
      $q = $injector.get '$q'
      $rootScope = $injector.get '$rootScope'
      factory = $injector.get 'menuFactory'
      service = $injector.get 'menuService'

    afterEach () ->
      $httpBackend.verifyNoOutstandingExpectation()
      $httpBackend.verifyNoOutstandingRequest()

    data =
      items: [
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

    it 'should get the menu and populate the factory', () ->
      cb =
        success: () ->
          expect(factory.get().length).toBe(data.items.length)

      $httpBackend.expectGET('/data/menu.json').respond 201, JSON.stringify data

      spyOn cb, 'success'

      service.get().then cb.success

      $httpBackend.flush()

      expect(cb.success).toHaveBeenCalled()

    it 'should populate the factory', () ->
      dfd = $q.defer()
      cb =
        success: () ->
          expect(factory.get().length).toBe(data.items.length)

      spyOn cb, 'success'

      dfd.promise.then cb.success
      service.handleSuccess dfd, data

      $rootScope.$digest()

      expect(cb.success).toHaveBeenCalled()

    it 'should reject the dfd in case of an error', () ->
      dfd = $q.defer()
      cb =
        success: () ->
        failure: () ->
          console.log 'failure'

      spyOn cb, 'success'
      spyOn cb, 'failure'

      dfd.promise.then cb.success, cb.failure

      service.handleFailure dfd

      $rootScope.$digest()

      expect(cb.success.calls.length).toBe 0
      expect(cb.failure).toHaveBeenCalled()