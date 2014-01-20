define([
  'config',
  'angular',
  'factory/page-loader-factory'
], function(cfg, A) {
  describe('Page loader factory', function() {
    var factory;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      factory = $injector.get('pageLoaderFactory');
    }));

    it('should $emit an event that says whether to hide or show the loader', function() {
      var showing = true,
          cb;

      cb = {
        handleLoader: function(event, show) {
          expect(show).toBe(showing);
        }
      };

      factory.addListener(cb.handleLoader);

      runs(function() {
        factory.show();
      });

      waits(250);

      runs(function() {
        showing = false;
        factory.hide();
      });
    });
  });
});
