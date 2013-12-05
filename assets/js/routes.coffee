define [
  'config'
  'angular'
  'controller/home-controller'
], (cfg, A) ->
  routes = ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/getting-started',
        templateUrl: cfg.path.partial + 'getting-started.html'

      .when '/code/:section',
        templateUrl: cfg.path.partial + 'code.html'

      .when '/code',
        templateUrl: cfg.path.partial + 'code.html'

      .when '/support',
        templateUrl: cfg.path.partial + 'support.html'

      .when '/',
        templateUrl: cfg.path.partial + 'home.html'

    $routeProvider.otherwise
      redirectTo: '/'

    $locationProvider.html5Mode true

  routes.$inject = [
    '$routeProvider'
    '$locationProvider'
  ]

  app = A.module cfg.ngApp
  app.config routes