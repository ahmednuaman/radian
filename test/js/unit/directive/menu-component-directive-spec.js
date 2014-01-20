define([
  'config',
  'angular',
  'directive/menu-component-directive'
], function(cfg, A) {
  describe('Menu component directive', function() {
    var el = A.element('<div data-menu-component data-ng-model="menuItems"></div>'),
        $httpBackend,
        $scope,
        createDirective,
        data;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $compile = $injector.get('$compile'),
          $compiled = $compile(el),
          $rootScope = $injector.get('$rootScope');

      $httpBackend = $injector.get('$httpBackend');
      $scope = $rootScope.$new();

      createDirective = function() {
        $compiled($scope);
      };
    }));

    afterEach(function() {
      $httpBackend.verifyNoOutstandingExpectation();
      $httpBackend.verifyNoOutstandingRequest();
    });

    data = [
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
    ];

    it('should generate a menu from a modal', function() {
      var directive;

      $httpBackend.expectGET(cfg.path.partial + 'directive/menu-component-partial.html')
        .respond(201, '<div class="menu-component"><ul><li data-ng-repeat="item in items"><a data-ng-href="{{item.href}}" data-ng-class="{&quot;selected&quot;: item.selected}">{item.title}}/a>/li>/ul></div>');

      directive = createDirective();
      $httpBackend.flush();

      $scope.menuItems = data;
      $scope.$digest();

      expect(el.find('li').length).toBe(data.length);
    });
  });
});
