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

    it('should $emit an event that says whether to hide or show the loader', function(done) {
      var showing = true,
          cb;

      cb = {
        handleLoader: function(event, show) {
          expect(show).toBe(showing);
          done();
        }
      };

      factory.addListener(cb.handleLoader);
      factory.show();

      setTimeout(function () {
        showing = false;
        factory.hide();
      }, 250);
    });
  });
});
