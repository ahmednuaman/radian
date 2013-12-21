# This factory provides a helpful mechanism and storage for the app's menu data. It deals with selecting a menu item
# when the [`$location`](http://docs.angularjs.org/api/ng.$location) has changed and populating and preparing the menu
# items from the raw data recieved from the API.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  'lodash'
  # Jump to [`collection/menu-items-collection.coffee`](menu-items-collection.html) ☛
  'collection/menu-items-collection'
  # Jump to [`factory/page-title-factory.coffee`](page-title-factory.html) ☛
  'factory/page-title-factory'
], (cfg, A, _, menuItemsCollection) ->
  menuFactory = ($location, $q, $rootScope, pageTitleFactory) ->
    handleFactorySetSuccess = (dfd, collection) ->
      factory.collection = collection

      factory.digest()
      dfd.resolve()

    $rootScope.$on '$locationChangeSuccess', (event) ->
      factory.digest()

    factory =
      collection: null
      selectedItem: null

      # This method is used by the [`service/menu-service.coffee`](menu-service.html) to populate the factory. It uses
      # deferred promises so that nothing is left down to "sheer luck", everything is async making it very stable.
      set: (serviceDfd, data) ->
        dfd = $q.defer()
        success = A.bind @, handleFactorySetSuccess, serviceDfd

        # The data is passed into a collection and held by the factory. The collection held by the factory is just a
        # raw `array` of `objects`. This follows the principle and simplicity of
        # [AngularJS's concept of `$scope` variables](http://docs.angularjs.org/api/ng.$rootScope.Scope).
        # Jump to [`collection/menu-items-collection.coffee`](menu-items-collection.html) ☛
        menuItemsCollection dfd, data
        dfd.promise.then success

      get: () ->
        factory.collection

      digest: () ->
        factory.setSelectedItemByHref $location.path()

      setSelectedItemByHref: (href) ->
        if factory.selectedItem
          factory.selectedItem.selected = false

        A.forEach factory.collection, (vo) ->
          if href is '/'
            vo.selected = vo.href is href
          else
            vo.selected = !!~vo.href.indexOf href

          if vo.selected
            factory.selectedItem = vo

            pageTitleFactory.setTitle vo.title

  menuFactory.$inject = [
    '$location'
    '$q'
    '$rootScope'
    'pageTitleFactory'
  ]

  app = A.module cfg.ngApp
  app.factory 'menuFactory', menuFactory
