define [
  'config'
  'angular'
  'collection/menu-items-collection'
], (cfg, A, menuItemsCollection) ->
  menuFactory = ($q) ->
    handleFactorySetSuccess = (dfd, collection) ->
      factory.collection = collection

      dfd.resolve()

    factory =
      set: (serviceDfd, data) ->
        dfd = $q.defer()
        success = A.bind @, handleFactorySetSuccess, serviceDfd

        menuItemsCollection dfd, data
        dfd.promise.then success

      get: () ->
        factory.collection

  menuFactory.$inject = [
    '$q'
  ]

  app = A.module cfg.ngApp
  app.factory 'menuFactory', menuFactory
