define([
  'angular',
  'controller/radian-controller',
  'directive/menu-component-directive',
  'factory/menu-factory',
  'factory/page-error-factory',
  'service/menu-service'
], function(A, RC) {
  RC('HeaderMenuController', [
    '$scope',
    'menuFactory',
    'menuService',
    'pageErrorFactory'
  ], {
    init: function() {

    },

    init: function() {
      this.loadMenu();
    },

    loadMenu: function() {
      var failure = A.bind(this, this.handleLoadMenuFailure),
          success = A.bind(this, this.handleLoadMenuSuccess);

      this.menuService.get().then(success, failure);
    },

    handleLoadMenuSuccess: function() {
      this.$scope.menuItems = this.menuFactory.get();
    },

    handleLoadMenuFailure: function() {
      this.pageErrorFactory.show500();
    }
  });
});