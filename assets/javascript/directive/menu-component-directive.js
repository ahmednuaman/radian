define([
  'config',
  'directive/radian-directive'
], function(cfg, RD) {
  RD('menuComponent', [], function() {
    return {
      templateUrl: cfg.path.partial + 'directive/menu-component-partial.html',
      restrict: 'A',
      replace: true,
      scope: {
        items: '=ngModel'
      }
    };
  });
});