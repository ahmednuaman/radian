define [
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
], (RC) ->
  class extends RC
    @register 'FooterController', [
      '$scope'
    ]

    init: () ->