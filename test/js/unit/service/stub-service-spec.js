define([
  'config',
  'angular',
  'service/stub-service'
], function(cfg, A) {
  describe('Stub service', function() {
    var service;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      service = $injector.get('stubService');
    }));

    it('should load', function() {
      expect(service.fooBar).toBeDefined();
    });
  });
});
