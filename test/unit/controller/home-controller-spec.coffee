define [
  'config'
  'angular'
  'controller/home-controller'
], (cfg, A) ->
  describe 'Home controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'homeController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()