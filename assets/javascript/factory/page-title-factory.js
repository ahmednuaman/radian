define([
  'factory/radian-factory'
], function(RF) {
  RF('pageTitleFactory', [
    '$rootScope'
  ], function($rootScope) {
    var event = 'pageTitleChange',
        emit,
        factory;

    emit = function(title) {
      $rootScope.$emit(event, title);
    };

    return factory = {
      setTitle: function(title) {
        emit(title);
      },

      addListener: function(callback) {
        $rootScope.$on(event, callback);
      }
    };
  });
});