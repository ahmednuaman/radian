define(['vo/stub-vo'], function(vo) {
  describe('Stub VO', function() {
    it('should return a nice VO', function() {
      var data,
          item;

      data = {
        foo: 'bar'
      };
      item = vo(data);

      expect(item.foo).toBe(data.foo);
    });
  });
});
