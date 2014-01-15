# This factory is similar to [`factory/page-title-factory.coffee`](page-title-factory.html) in that it deals with a
# problem of sending data between multiple points in your app. What this factory specifically does is all modules of
# your app to show and hide the page loader, eg: when the user moves to another page.
define [
  # Jump to [`factory/radian-factory.coffee`](radian-factory.html) ☛
  'factory/radian-factory'
], (RF) ->
  RF 'pageLoaderFactory', [
    '$rootScope'
  ], ($rootScope) ->
    event = 'pageLoaderChange'

    emit = (show) ->
      $rootScope.$emit event, show

    factory =
      setShow: (show) ->
        emit show

      show: () ->
        factory.setShow true

      hide: () ->
        factory.setShow false

      addListener: (callback) ->
        $rootScope.$on event, callback
