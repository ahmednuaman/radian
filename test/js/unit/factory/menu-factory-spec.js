define([
  'config',
  'angular',
  'factory/menu-factory'
], function(cfg, A) {
  describe('Menu factory', function() {
    var $location,
        $q,
        $rootScope,
        data,
        factory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      $location = $injector.get('$location');
      $q = $injector.get('$q');
      $rootScope = $injector.get('$rootScope');
      factory = $injector.get('menuFactory');
    }));

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

    it('should populate the factory and the collection', function() {
      var dfd = $q.defer(),
          cb;

      cb = {
        success: function() {
          expect(factory.collection.length).toBe(data.length);
          expect(factory.get().length).toBe(data.length);
          expect(factory.collection[0].selected).toBe(true);
        }
      };

      dfd.promise.then(cb.success);
      factory.set(dfd, data);

      $rootScope.$digest();
    });

    it('should select an item by a specified href', function() {
      var dfd = $q.defer(),
          cb,
          check;

      check = function(item) {
        factory.setSelectedItemByHref(item.href);
        expect(factory.selectedItem.href).toBe(item.href);
        expect(factory.selectedItem.selected).toBe(true);
        expect(item.selected).toBe(true);
      };

      cb = {
        success: function() {
          var items;
          items = factory.get();
          check(items[0]);
          check(items[1]);
        }
      };

      dfd.promise.then(cb.success);
      factory.set(dfd, data);

      $rootScope.$digest();
    });

    it('should update the selected item if the location changes', function() {
      var dfd = $q.defer(),
          cb;

      cb = {
        success: function() {
          var item, items;
          items = factory.get();
          item = items[2];
          $location.path(item.href);
          $rootScope.$emit('$locationChangeSuccess');
          expect(factory.selectedItem.href).toBe(item.href);
        }
      };

      dfd.promise.then(cb.success);
      factory.set(dfd, data);

      $rootScope.$digest();
    });
  });
});
