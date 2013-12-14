define [
  'vo/menu-item-vo'
], (vo) ->
  describe 'Menu item VO', () ->
    it 'should return a nice VO', () ->
      data =
        title: 'Getting started'
        href: '/'
      item = vo data

      expect(item.title).toBe data.title
      expect(item.href).toBe data.href
      expect(item.selected).toBe false