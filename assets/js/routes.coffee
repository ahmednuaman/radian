define [
  'config'
  'angular'
], (cfg, A) ->
  routes = ($routeProvider, $locationProvider) ->
    # $routeProvider
    #   .when '/',
    #     templateUrl: cfg.path.partial + 'some-partial.html'

    # $routeProvider.otherwise
    #   redirectTo: '/'

    $locationProvider.html5Mode true

  routes.$inject = [
    '$routeProvider'
    '$locationProvider'
  ]

  app = A.module cfg.ngApp
  app.config routes