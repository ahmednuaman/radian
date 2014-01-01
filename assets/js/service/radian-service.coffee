define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  class RadianService
    @register: (name, deps) ->
      helper.register @, helper.type.service, name, deps

    constructor: () ->
      helper.construct @, arguments