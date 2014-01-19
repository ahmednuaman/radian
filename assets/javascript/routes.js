define([
  'config',
  'angular',
  'controller/error-controller',
  'controller/home-controller'
], function(cfg, A) {
  var app,
      routes;

  routes = function($routeProvider, $locationProvider) {
    $routeProvider.when('/code', {
      templateUrl: cfg.path.partial + 'code-partial.html'
    })
    .when('/error/:code', {
      templateUrl: cfg.path.partial + 'error-partial.html'
    })
    .when('/error', {
      templateUrl: cfg.path.partial + 'error-partial.html'
    })
    .when('/faqs', {
      templateUrl: cfg.path.partial + 'faqs-partial.html'
    })
    .when('/', {
      templateUrl: cfg.path.partial + 'home-partial.html'
    });

    $routeProvider.otherwise({
      redirectTo: '/'
    });

    $locationProvider.html5Mode(true);
  };

  routes.$inject = ['$routeProvider', '$locationProvider'];

  app = A.module(cfg.ngApp);
  app.config(routes);
});