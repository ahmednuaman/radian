define [
  'config'
  'angular'
  'controller/footer-controller'
], (cfg, A) ->
  describe 'Footer controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'footerController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()