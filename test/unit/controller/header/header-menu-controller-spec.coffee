define [
  'config'
  'angular'
  'controller/header/header-menu-controller'
  'factory/menu-factory'
  'factory/page-error-factory'
], (cfg, A) ->
  describe 'Header menu controller', () ->
    $httpBackend = null
    $scope = null
    createController = null
    menuFactory = null
    pageErrorFactory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $httpBackend = $injector.get '$httpBackend'
      $rootScope = $injector.get '$rootScope'
      menuFactory = $injector.get 'menuFactory'
      pageErrorFactory = $injector.get 'pageErrorFactory'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'headerMenuController',
          $scope: $scope
          menuFactory: menuFactory
          pageErrorFactory: pageErrorFactory

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

    it 'should populate $scope.menuItems', () ->
      cb =
        success: () ->
          expect(menuFactory.get().length).toBe(data.items.length)

      $httpBackend.expectGET(cfg.api.data).respond 201, JSON.stringify data

      controller = createController()

      $httpBackend.flush()

      expect($scope.menuItems.length).toBe menuFactory.get().length

    it 'should throw a 500 error if loading the menu fails', () ->
      spyOn pageErrorFactory, 'show500'

      $httpBackend.expectGET(cfg.api.data).respond 500

      controller = createController()

      $httpBackend.flush()

      expect(pageErrorFactory.show500).toHaveBeenCalled()