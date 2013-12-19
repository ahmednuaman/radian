define [
  'config'
  'angular'
  'controller/error-controller'
], (cfg, A) ->
  describe 'Error controller', () ->
    $routeParams = null
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'
      $routeParams = $injector.get '$routeParams'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'errorController',
          $scope: $scope
          $routeParams: $routeParams

    it 'should change the $scope.code according to $routeParams.code', () ->
      code = '123'
      $routeParams.code = code
      controller = createController()

      expect($scope.code).toBe code

    it 'should default $scope.code to 404 if there is no $routeParams.code', () ->
      controller = createController()

      expect($scope.code).toBe '404'