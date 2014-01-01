define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  class Controller
    @register: (name, deps) ->
      helper.register @, helper.type.controller, name, deps

    bindAll: () ->
      helper.bindAll @

    constructor: (args...) ->
      helper.construct @, args