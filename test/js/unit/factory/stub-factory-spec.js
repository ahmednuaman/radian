define([
  'config',
  'angular',
  'factory/stub-factory'
], function(cfg, A) {
  describe('Stub factory', function() {
    var factory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      factory = $injector.get('stubFactory');
    }));

    it('should load', function() {
      expect(factory.publicMethod).toBeDefined();
    });
  });
});
