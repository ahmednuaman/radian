define [
  'config'
  'angular'
  'controller/stub-controller'
], (cfg, A) ->
  describe 'Stub controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'stubController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()