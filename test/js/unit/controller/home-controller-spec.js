define([
  'config',
  'angular',
  'controller/home-controller'
], function(cfg, A) {
  describe('Home controller', function() {
    var $scope,
        createController;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $controller = $injector.get('$controller'),
          $rootScope = $injector.get('$rootScope');

      $scope = $rootScope.$new();

      createController = function() {
        return $controller('HomeController', {
          $scope: $scope
        });
      };
    }));

    it('should load', function() {
      var controller = createController();
    });
  });
});
