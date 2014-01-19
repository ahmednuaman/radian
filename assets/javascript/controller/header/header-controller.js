define([
  'config',
  'controller/radian-controller',
  'controller/header/header-menu-controller'
], function(cfg, RC) {
  RC('HeaderController', [
    '$scope'
  ], {
    init: function() {
      this.addPartials();
    },

    addPartials: function() {
      this.$scope.menuPartial = cfg.path.partial + 'header/header-menu-partial.html';
    }
  });
});