define([
  'config',
  'angular',
  'service/radian-service',
  'factory/menu-factory'
], function(cfg, A, RS) {
  RS('menuService', [
    '$q',
    '$resource',
    'menuFactory'
  ], {
    init: function() {
      this.menu = this.$resource(cfg.api.data);
    },

    get = function() {
      var dfd = this.$q.defer(),
          failure = A.bind(this, this.handleFailure, dfd),
          success = A.bind(this, this.handleSuccess, dfd);

      this.menu.get()
        .$promise.then(success, failure);

      return dfd.promise;
    },

    handleSuccess: function(dfd, menu) {
      this.menuFactory.set(dfd, menu.items);
    },

    handleFailure: function(dfd) {
      dfd.reject();
    }
  });
});