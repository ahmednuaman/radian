define([
  'config',
  'angular',
  'controller/error-controller'
], function(cfg, A) {
  describe('Error controller', function() {
    var $routeParams,
        $scope,
        createController,
        pageTitleFactory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $controller = $injector.get('$controller'),
          $rootScope = $injector.get('$rootScope');

      $routeParams = $injector.get('$routeParams');
      pageTitleFactory = $injector.get('pageTitleFactory');
      $scope = $rootScope.$new();

      createController = function() {
        $controller('ErrorController', {
          $scope: $scope,
          $routeParams: $routeParams
        });
      };
    }));

    it('should change the $scope.code and title according to $routeParams.code', function() {
      var code = '123',
          cb,
          controller;

      cb = {
        handleTitle: function(event, newTitle) {
          expect(newTitle).toContain(code);
          expect($scope.code).toBe(code);
        }
      };

      pageTitleFactory.addListener(cb.handleTitle);
      $routeParams.code = code;

      controller = createController();
    });

    it('should default $scope.code to 404 if there is no $routeParams.code', function() {
      var controller = createController();

      expect($scope.code).toBe('404');
    });
  });
});
