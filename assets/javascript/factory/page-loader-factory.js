define([
  'factory/radian-factory'
], function(RF) {
  RF('pageLoaderFactory', [
    '$rootScope'
  ], function($rootScope) {
    var event = 'pageLoaderChange',
        emit,
        factory;

    emit = function(show) {
      return $rootScope.$emit(event, show);
    };

    factory = {
      setShow: function(show) {
        emit(show);
      },

      show: function() {
        factory.setShow(true);
      },

      hide: function() {
        factory.setShow(false);
      },

      addListener: function(callback) {
        $rootScope.$on(event, callback);
      }
    };

    return factory;
  });
});