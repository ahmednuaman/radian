define [
  'config'
  'angular'
  'lodash'
  'collection/menu-items-collection'
], (cfg, A, _, menuItemsCollection) ->
  pageErrorFactory = ($location) ->
    emit = (code) ->
      $location.path "/error/#{code}"

    factory =
      showError: (code) ->
        emit code

    _.forEach ['404', '500'], (code) ->
      factory["show#{code}"] = () ->
        factory.showError code

    factory

  pageErrorFactory.$inject = [
    '$location'
  ]

  app = A.module cfg.ngApp
  app.factory 'pageErrorFactory', pageErrorFactory
