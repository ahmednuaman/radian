define [
  'vo/stub-vo'
], (vo) ->
  describe 'Stub VO', () ->
    it 'should return a nice VO', () ->
      data =
        foo: 'bar'
      item = vo data

      expect(item.foo).toBe data.foo