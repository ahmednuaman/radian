# This is a base controller class to ease the controller creation process. To see an example of how to use this have a
# look at [`controller/stub-controller.coffee`](stub-controller.html).
define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  class RadianController
    @register: (name, deps) ->
      helper.register @, helper.type.controller, name, deps

    constructor: () ->
      helper.construct @, arguments