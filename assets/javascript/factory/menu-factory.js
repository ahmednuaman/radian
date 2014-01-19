define([
  'angular',
  'lodash',
  'factory/radian-factory',
  'collection/menu-items-collection',
  'factory/page-title-factory'
], function(A, _, RF, menuItemsCollection) {
  RF('menuFactory', [
    '$location',
    '$q',
    '$rootScope',
    'pageTitleFactory'
  ], function($location, $q, $rootScope, pageTitleFactory) {
    var factory,
        handleFactorySetSuccess;

    handleFactorySetSuccess = function(dfd, collection) {
      factory.collection = collection;
      factory.digest();

      dfd.resolve();
    };

    $rootScope.$on('$locationChangeSuccess', function(event) {
      factory.digest();
    });

    return factory = {
      collection: null,
      selectedItem: null,

      set: function(serviceDfd, data) {
        var dfd = $q.defer(),
            success = A.bind(this, handleFactorySetSuccess, serviceDfd);

        menuItemsCollection(dfd, data);
        dfd.promise.then(success);
      },

      get: function() {
        return factory.collection;
      },

      digest: function() {
        factory.setSelectedItemByHref($location.path());
      },

      setSelectedItemByHref: function(href) {
        if (factory.selectedItem) {
          factory.selectedItem.selected = false;
        }

        A.forEach(factory.collection, function(vo, i) {
          if (href === '/') {
            vo.selected = vo.href === href;
          } else {
            vo.selected = !!~vo.href.indexOf(href);
          }

          if (vo.selected) {
            factory.selectedItem = factory.collection[i] = vo;
            pageTitleFactory.setTitle(vo.title);
          }
        });
      }
    };
  });
});