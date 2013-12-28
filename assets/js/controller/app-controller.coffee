# This is the heart and soul of the app. It's up to you and your team on whether you choose to use a 'class' pattern
# but from experience following this pattern provides a clean and adaptable layout for your code.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  # Before `appController` is added to the app it is vital to load in the
  # [`ngRoute`](http://docs.angularjs.org/api/ngRoute.$routeProvider) configuration. If your app is driven from an API
  # and thus the navigation needs to be loaded before the app can work out where to go then it's a good idea to use
  # [`$route.reload()`](http://docs.angularjs.org/api/ngRoute.$route) after the navigation data has been loaded.
  # Jump to [`routes.coffee`](routes.html) ☛
  'routes'
  # Jump to [`controller/header/header-controller.coffee`](header-controller.html) ☛
  'controller/header/header-controller'
  # Jump to [`controller/footer-controller.coffee`](footer-controller.html) ☛
  'controller/footer-controller'
  # One problem that people struggled with regarding [AngularJS](http://angularjs.org) is how to deal with sending data
  # between modules in the app. This has been resolved here by the use of factories, in this case it's a factory that
  # broadcasts updates to the document's title and any module that can inject the factory can set the title.
  # This deals with issues around misuse of the `$rootScope`/`$scope` to pass data up and down the chain and keeps
  # everything testable.
  # Jump to [`factory/page-title-factory.coffee`](page-title-factory.html) ☛
  'factory/page-title-factory'
], (cfg, A) ->
  # Every controller class in radian follows the same pattern. It's also preferable to explicity specify the `$inject`
  # modules as this code will be minified.
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
      @$scope.ctaPartial = cfg.path.partial + 'cta-partial.html'
      @$scope.footerPartial = cfg.path.partial + 'footer-partial.html'
      @$scope.headerPartial = cfg.path.partial + 'header/header-partial.html'

    handlePageTitleChange: (event, title) ->
      @$scope.pageTitle = "Radian ~ A scalable AngularJS framework ~ #{title}"

  app = A.module cfg.ngApp
  app.controller 'appController', AppController
