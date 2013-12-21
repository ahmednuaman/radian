# This is a simple menu directive. All the magic is in the
# [partial](/assets/partial/directive/menu-component-partial.jade).
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
], (cfg, A) ->
  menuComponentDirective = () ->
    templateUrl: cfg.path.partial + 'directive/menu-component-partial.html'
    restrict: 'A'
    replace: true
    scope:
      items: '=ngModel'

  app = A.module cfg.ngApp
  app.directive 'menuComponent', menuComponentDirective
