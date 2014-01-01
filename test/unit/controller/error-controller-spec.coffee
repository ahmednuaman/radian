define [
  'config'
  'angular'
  'controller/error-controller'
], (cfg, A) ->
  describe 'Error controller', () ->
    $routeParams = null
    $scope = null
    createController = null
    pageTitleFactory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'
      $routeParams = $injector.get '$routeParams'
      pageTitleFactory = $injector.get 'pageTitleFactory'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'ErrorController',
          $scope: $scope
          $routeParams: $routeParams

    it 'should change the $scope.code and title according to $routeParams.code', () ->
      code = '123'
      cb =
        handleTitle: (event, newTitle) ->
          expect(newTitle).toContain code
          expect($scope.code).toBe code

      pageTitleFactory.addListener cb.handleTitle

      $routeParams.code = code
      controller = createController()

    it 'should default $scope.code to 404 if there is no $routeParams.code', () ->
      controller = createController()

      expect($scope.code).toBe '404'