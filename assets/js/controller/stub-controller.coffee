# This is a stub controller. It does nothing.
define [
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
], (RC) ->
  class StubController extends RC
    @register 'StubController', [
      '$scope'
    ]

    init: () ->