define [
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
], (RC) ->
  class FooterController extends RC
    @register 'FooterController', [
      '$scope'
    ]

    init: () ->