define [
  'config'
  'angular'
  'controller/error-controller'
  'controller/home-controller'
], (cfg, A) ->
  routes = ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/code/:section',
        templateUrl: cfg.path.partial + 'code-partial.html'

      .when '/code',
        templateUrl: cfg.path.partial + 'code-partial.html'

      .when '/contributing',
        templateUrl: cfg.path.partial + 'contributing-partial.html'

      .when '/error/:code',
        templateUrl: cfg.path.partial + 'error-partial.html'

      .when '/error',
        templateUrl: cfg.path.partial + 'error-partial.html'

      .when '/support',
        templateUrl: cfg.path.partial + 'support-partial.html'

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