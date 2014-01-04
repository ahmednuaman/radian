# This factory deals with a common problem in [AngularJS](https://www.google.co.uk/search?q=passing+%24scope+variables)
# relating to passing data up and down the `$scope` chain. The solution is simple yet elegant: use a `$rootScope` event
# and callback. This means that any part of the application can set the title by calling
# `pageTitleFactory.setTitle 'foo'` and listen to a title change by passing a callback into
# `pageTitleFactory.addListener cb`.
define [
  # Jump to [`factory/radian-factory.coffee`](radian-factory.html) ☛
  'factory/radian-factory'
], (RF) ->
  RF 'pageTitleFactory', [
    '$rootScope'
  ], ($rootScope) ->
    event = 'pageTitleChange'

    emit = (title) ->
      $rootScope.$emit event, title

    factory =
      setTitle: (title) ->
        emit title

      addListener: (callback) ->
        $rootScope.$on event, callback
