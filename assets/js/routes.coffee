# A pretty [standard AngularJS ngRoute](http://docs.angularjs.org/api/ngRoute.$routeProvider) set up.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  # Jump to [`controller/error-controller.coffee`](error-controller.html) ☛
  'controller/error-controller'
  # Jump to [`controller/home-controller.coffee`](home-controller.html) ☛
  'controller/home-controller'
], (cfg, A) ->
  docsResolver = ($window) ->
    $window.location.href = '/docs/app.html'

  docsResolver.$inject = [
    '$window'
  ]

  routes = ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/code',
        templateUrl: cfg.path.partial + 'code-partial.html'

      .when '/docs',
        resolve:
          factory: docsResolver

      .when '/error/:code',
        templateUrl: cfg.path.partial + 'error-partial.html'

      .when '/error',
        templateUrl: cfg.path.partial + 'error-partial.html'

      .when '/',
        templateUrl: cfg.path.partial + 'home-partial.html'

    $routeProvider.otherwise
      redirectTo: '/'

    $locationProvider.html5Mode true

  routes.$inject = [
    '$routeProvider'
    '$locationProvider'
  ]

  app = A.module cfg.ngApp
  app.config routes