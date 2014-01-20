define(['vo/menu-item-vo'], function(vo) {
  describe('Menu item VO', function() {
    it('should return a nice VO', function() {
      var data,
          item;

      data = {
        title: 'Getting started',
        href: '/'
      };
      item = vo(data);

      expect(item.title).toBe(data.title);
      expect(item.href).toBe(data.href);
      expect(item.selected).toBe(false);
    });
  });
});
