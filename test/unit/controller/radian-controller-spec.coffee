define [
  'config'
  'angular'
  'controller/radian-controller'
  'controller/stub-controller'
], (cfg, A, RC) ->
  describe 'Radian controller', () ->
    $scope = null
    createController = null
    foo = 'bar'

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()
      $scope.foo = foo

      createController = () ->
        $controller 'StubController',
          $scope: $scope

    it 'should create a controller', () ->
      createController()

      expect($scope.foo).toBe foo