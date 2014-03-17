define([
  'config',
  'angular',
  'controller/header/header-menu-controller',
  'factory/menu-factory',
  'factory/page-error-factory'
], function(cfg, A) {
  describe('Header menu controller', function() {
    var $httpBackend,
        $scope,
        createController,
        data,
        menuFactory,
        pageErrorFactory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $controller = $injector.get('$controller'),
          $rootScope = $injector.get('$rootScope');
      ;
      $httpBackend = $injector.get('$httpBackend');
      menuFactory = $injector.get('menuFactory');
      pageErrorFactory = $injector.get('pageErrorFactory');
      $scope = $rootScope.$new();

      createController = function() {
        return $controller('HeaderMenuController', {
          $scope: $scope,
          menuFactory: menuFactory,
          pageErrorFactory: pageErrorFactory
        });
      };
    }));

    afterEach(function() {
      $httpBackend.verifyNoOutstandingExpectation();
      $httpBackend.verifyNoOutstandingRequest();
    });

    data = {
      items: [
        {
          title: '1',
          href: '/'
        }, {
          title: '2',
          href: '/2'
        }, {
          title: '3',
          href: '/3'
        }, {
          title: '4',
          href: '/4'
        }
      ]
    };

    it('should populate $scope.menuItems', function() {
      var cb,
          controller;

      cb = {
        success: function() {
          expect(menuFactory.get().length).toBe(data.items.length);
        }
      };

      $httpBackend.expectGET(cfg.api.data).respond(201, JSON.stringify(data));

      controller = createController();
      $httpBackend.flush();

      expect($scope.menuItems.length).toBe(menuFactory.get().length);
    });

    it('should throw a 500 error if loading the menu fails', function() {
      var controller;

      spyOn(pageErrorFactory, 'show500');
      $httpBackend.expectGET(cfg.api.data).respond(500);

      controller = createController();
      $httpBackend.flush();

      expect(pageErrorFactory.show500).toHaveBeenCalled();
    });
  });
});
