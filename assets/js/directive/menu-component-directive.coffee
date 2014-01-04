# This is a simple menu directive. All the magic is in the
# [partial](/assets/partial/directive/menu-component-partial.jade).
define [
  'config'
  # Load up the base directive, all controllers inherit from it. All hail the base directive. Such meta.
  # Jump to [`directive/radian-directive.coffee`](radian-directive.html) ☛
  'directive/radian-directive'
], (cfg, RD) ->
  RD 'menuComponent', [], () ->
    templateUrl: cfg.path.partial + 'directive/menu-component-partial.html'
    restrict: 'A'
    replace: true
    scope:
      items: '=ngModel'