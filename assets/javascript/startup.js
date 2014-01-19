define([
  'config',
  'angular'
], function(cfg, A) {
  require([
    'angular-animate',
    'angular-resource',
    'angular-route'
  ], function() {
    A.module(cfg.ngApp, [
      'ngAnimate',
      'ngResource',
      'ngRoute'
    ]);

    require(['controller/app-controller'], function() {
      A.bootstrap(document.documentElement, [cfg.ngApp]);
    });
  });
});