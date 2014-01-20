define([
  'config',
  'angular',
  'collection/stub-collection',
  'vo/stub-vo'
], function(cfg, A, collection, vo) {
  describe('Stub collection', function() {
    var $q,
        $rootScope;

    beforeEach(inject(function($injector) {
      $q = $injector.get('$q');
      $rootScope = $injector.get('$rootScope');
    }));

    it('should a nice collection', function() {
      var dfd = $q.defer(),
          cb,
          data,
          datas;
      data = {};
      datas = [data, data, data];
      cb = {
        success: function(VOs) {
          expect(VOs.length).toBe(datas.length);
        }
      };

      dfd.promise.then(cb.success);
      collection(dfd, datas);

      $rootScope.$digest();
    });
  });
});
