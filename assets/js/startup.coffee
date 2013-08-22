define [
  'config'
  'angular'
], (cfg, A) ->
  A.module cfg.ngApp, []

  require ['controller/app-controller'], () ->
    A.bootstrap document.documentElement, [cfg.ngApp]