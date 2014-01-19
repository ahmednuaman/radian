define([
  'service/radian-service'
], function(RS) {
  RS('stubService', [
    '$q',
    '$resource'
  ], {
    init: function() {
      this.fooBar = this.$resource('/foo/bar.json');
    }
  });
});