define [
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
