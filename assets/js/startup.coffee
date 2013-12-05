define [
  'config'
  'angular'
], (cfg, A) ->
  require ['angular-route'], () ->
    A.module cfg.ngApp, ['ngRoute']

    require ['controller/app-controller'], () ->
      A.bootstrap document.documentElement, [cfg.ngApp]