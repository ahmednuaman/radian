define [
  'config'
  'angular'
], (cfg, A) ->
  require [
    'angular-resource'
    'angular-route'
  ], () ->
    A.module cfg.ngApp, [
      'ngResource'
      'ngRoute'
    ]

    require ['controller/app-controller'], () ->
      A.bootstrap document.documentElement, [cfg.ngApp]