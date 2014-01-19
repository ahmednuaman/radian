define([
  'controller/radian-controller'
  'factory/page-title-factory'
], function(RC) {
  RC('ErrorController', [
    '$scope',
    '$routeParams',
    'pageTitleFactory'
  ], {
    init: function() {
      this.$scope.code = this.$routeParams.code || '404';

      this.pageTitleFactory.setTitle('Error ' + this.$scope.code);
    }
  });
});