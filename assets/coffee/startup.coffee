# This file controls the start up sequence for the app. Since everything's AMD based, the app needs to load
# [AngularJS](http://angularjs.org) and the [`config.coffee`](config.html) first, then any AngularJS modules (in this
# case it's using [`ngAnimate`](http://docs.angularjs.org/api/ngAnimate),
# [`ngResource`](http://docs.angularjs.org/api/ngResource) and [`ngRoute`](http://docs.angularjs.org/api/ngRoute)) and
# finally getting the Angular module as an app ready, loading [`controller/app-controller.coffee`](app-controller.html)
# and bootstrapping the document, and away we go.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
], (cfg, A) ->
  require [
    'angular-animate'
    'angular-resource'
    'angular-route'
  ], () ->
    A.module cfg.ngApp, [
      'ngAnimate'
      'ngResource'
      'ngRoute'
    ]

    # Jump to [`controller/app-controller.coffee`](app-controller.html) ☛
    require ['controller/app-controller'], () ->
      A.bootstrap document.documentElement, [cfg.ngApp]