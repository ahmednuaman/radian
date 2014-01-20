define([
  'config',
  'angular',
  'filter/stub-filter'
], function(cfg, A) {
  describe('Stub filter', function() {
    var $location,
        filter;

    beforeEach(module(cfg.ngApp));
    beforeEach(inject(function($injector) {
      var $filter = $injector.get('$filter');

      $location = $injector.get('$location');
      filter = $filter('stub');
    }));

    it('should run the filter', function() {
      var input = 'foo',
          filtered;

      filtered = filter(input);

      expect(filtered).toBe('input ' + input + ', $location.path() ' + ($location.path()));
    });
  });
});
