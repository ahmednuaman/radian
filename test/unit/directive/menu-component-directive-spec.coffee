define [
  'config'
  'angular'
  'directive/menu-component-directive'
], (cfg, A) ->
  describe 'Menu component directive', () ->
    $httpBackend = null
    $scope = null
    createDirective = null
    el = A.element '<div data-menu-component data-ng-model="menuItems"></div>'

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $compile = $injector.get '$compile'
      $httpBackend = $injector.get '$httpBackend'
      $rootScope = $injector.get '$rootScope'

      $compiled = $compile el
      $scope = $rootScope.$new()

      createDirective = () ->
        $compiled $scope

    afterEach () ->
      $httpBackend.verifyNoOutstandingExpectation()
      $httpBackend.verifyNoOutstandingRequest()

    data = [
      title: '1'
      href: '/'
    ,
      title: '2'
      href: '/2'
    ,
      title: '3'
      href: '/3'
    ,
      title: '4'
      href: '/4'
    ]

    it 'should generate a menu from a modal', () ->
      $httpBackend.expectGET(cfg.path.partial + 'directive/menu-component-partial.html').respond 201, """
      <div class="menu-component">
        <ul>
          <li data-ng-repeat="item in items">
            <a data-ng-href="{{item.href}}" data-ng-class="{&quot;selected&quot;: item.selected}">
              {{item.title}}
            </a>
          </li>
        </ul>
      </div>"""

      directive = createDirective()

      $httpBackend.flush()

      $scope.menuItems = data
      $scope.$digest()

      expect(el.find('li').length).toBe data.length