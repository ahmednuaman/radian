# This is a stub directive. It does nothing.
define [
  'config'
  # Jump to [`directive/radian-directive.coffee`](radian-directive.html) ☛
  'directive/radian-directive'
], (cfg, RD) ->
  RD 'stub', [
    '$rootScope'
  ], ($rootScope) ->
    templateUrl: cfg.path.partial + 'directive/stub-partial.html'
    restrict: 'A'
    replace: true
    scope:
      items: '=ngModel'
    link: ($scope, $element, $attrs) ->