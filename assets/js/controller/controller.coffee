define [
  'helper/module-helper'
], (hlpr) ->
  class Controller
    @inject: (args...) ->
      hlpr.inject @, args

    @register: (name, deps) ->
      @inject.apply @, deps
      hlpr.register @, 'controller', name, deps

    constructor: (args...) ->
      hlpr.construct @, args