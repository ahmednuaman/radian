define([
  'config',
  'angular',
  'controller/app-controller',
  'factory/page-loader-factory',
  'factory/page-title-factory'
], function(cfg, A) {
  describe('App controller', function() {
    var $scope,
        createController,
        pageLoaderFactory,
        pageTitleFactory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $controller = $injector.get('$controller'),
          $rootScope = $injector.get('$rootScope');

      pageLoaderFactory = $injector.get('pageLoaderFactory');
      pageTitleFactory = $injector.get('pageTitleFactory');
      $scope = $rootScope.$new();

      createController = function() {
        return $controller('AppController', {
          $scope: $scope,
          pageTitleFactory: pageTitleFactory
        });
      };
    }));

    it('should add the header and footer partials', function() {
      var controller = createController();
      expect($scope.headerPartial).toBeDefined();
      expect($scope.footerPartial).toBeDefined();
    });

    it('should change the title when an event is fired from pageTitleFactory', function() {
      var controller = createController(),
          title = 'foo';

      pageTitleFactory.setTitle(title);
      expect($scope.pageTitle).toContain(title);
    });

    it('should hide the loader when an event is fired from pageLoaderFactory', function() {
      var controller = createController();

      $scope.handleViewLoaded();
      expect($scope.hideLoader).toBe(true);
    });
  });
});
