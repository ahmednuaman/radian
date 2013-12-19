define [
  'config'
  'angular'
  'controller/header/header-controller'
], (cfg, A) ->
  describe 'Header controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'headerController',
          $scope: $scope

    it 'should add the menu partial', () ->
      controller = createController()

      expect($scope.menuPartial).toBeDefined()