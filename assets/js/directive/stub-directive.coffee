# This is a stub directive. It does nothing.
define [
  'config'
  'angular'
], (cfg, A) ->
  stubDirective = () ->
    templateUrl: cfg.path.partial + 'directive/stub-partial.html'
    restrict: 'A'
    replace: true
    scope:
      items: '=ngModel'
    link: ($scope, $element, $attrs) ->


  app = A.module cfg.ngApp
  app.directive 'stub', stubDirective
