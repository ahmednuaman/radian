define([
  'config',
  'angular',
  'factory/page-error-factory'
], function(cfg, A) {
  describe('Page error factory', function() {
    var $location,
        factory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      $location = $injector.get('$location');
      factory = $injector.get('pageErrorFactory');
    }));

    it('should change the $location according to an error code', function() {
      factory.show500();
      expect($location.path()).toBe('/error/500');

      factory.showError(404);
      expect($location.path()).toBe('/error/404');
    });
  });
});
