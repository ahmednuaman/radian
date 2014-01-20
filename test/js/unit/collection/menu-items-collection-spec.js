define([
  'config',
  'angular',
  'collection/menu-items-collection',
  'vo/menu-item-vo'
], function(cfg, A, collection, vo) {
  describe('Menu items collection', function() {
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
      data = {
        title: 'foo',
        href: '/bar'
      };
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
