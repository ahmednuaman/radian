define [
  'config'
  'angular'
], (cfg, A) ->
  pageTitleFactory = ($rootScope) ->
    event = 'pageTitleChange'

    emit = (title) ->
      $rootScope.$emit event, title

    factory =
      setTitle: (title) ->
        emit title

      addListener: (callback) ->
        $rootScope.$on event, callback

  pageTitleFactory.$inject = [
    '$rootScope'
  ]

  app = A.module cfg.ngApp
  app.factory 'pageTitleFactory', pageTitleFactory
