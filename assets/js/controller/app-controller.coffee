# This is the heart and soul of the app.
define [
  'config'
  'angular'
  'routes'
  'controller/header/header-controller'
  'controller/footer-controller'
  'factory/page-title-factory'
], (cfg, A) ->
  class AppController
    @$inject = [
      '$scope'
      'pageTitleFactory'
    ]

    constructor: (@$scope, @pageTitleFactory) ->
      @init()

    init: () ->
      @addListeners()
      @addPartials()

    addListeners: () ->
      @pageTitleFactory.addListener A.bind @, @handlePageTitleChange

    addPartials: () ->
      @$scope.headerPartial = cfg.path.partial + 'header/header-partial.html'
      @$scope.footerPartial = cfg.path.partial + 'footer-partial.html'

    handlePageTitleChange: (event, title) ->
      @$scope.pageTitle = "radian ~ #{title}"

  app = A.module cfg.ngApp
  app.controller 'appController', AppController
