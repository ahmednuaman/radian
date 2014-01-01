define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  class RadianController
    @register: (name, deps) ->
      helper.register @, helper.type.controller, name, deps

    constructor: () ->
      helper.construct @, arguments