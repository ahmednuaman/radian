define [
  'config'
  'angular'
  'factory/menu-factory'
], (cfg, A) ->
  describe 'Menu factory', () ->
    $location = null
    $q = null
    $rootScope = null
    factory = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $location = $injector.get '$location'
      $q = $injector.get '$q'
      $rootScope = $injector.get '$rootScope'
      factory = $injector.get 'menuFactory'

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

    it 'should populate the factory and return the collection', () ->
      dfd = $q.defer()
      cb =
        success: () ->
          expect(factory.collection.length).toBe data.length
          expect(factory.get().length).toBe data.length
          expect(factory.collection[0].selected).toBe true

      dfd.promise.then cb.success
      factory.set dfd, data

      $rootScope.$digest()

    it 'should select an item by a specified href', () ->
      dfd = $q.defer()
      check = (item) ->
        factory.setSelectedItemByHref item.href

        expect(factory.selectedItem.href).toBe item.href
        expect(factory.selectedItem.selected).toBe true
        expect(item.selected).toBe true

      cb =
        success: () ->
          items = factory.get()

          check items[0]
          check items[1]

      dfd.promise.then cb.success
      factory.set dfd, data

      $rootScope.$digest()

    it 'should update the selected item if the location changes', () ->
      dfd = $q.defer()
      cb =
        success: () ->
          items = factory.get()
          item = items[2]

          $location.path item.href

          $rootScope.$emit '$locationChangeSuccess'

          expect(factory.selectedItem.href).toBe item.href

      dfd.promise.then cb.success
      factory.set dfd, data

      $rootScope.$digest()