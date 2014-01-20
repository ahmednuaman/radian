define([
  'config',
  'angular',
  'factory/page-title-factory'
], function(cfg, A) {
  describe('Page title factory', function() {
    var factory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      factory = $injector.get('pageTitleFactory');
    }));

    it('should $emit an event that contains a new title', function() {
      var title = 'foo',
          cb;

      cb = {
        handleTitle: function(event, newTitle) {
          expect(newTitle).toBe(title);
        }
      };

      factory.addListener(cb.handleTitle);
      factory.setTitle(title);
    });
  });
});
