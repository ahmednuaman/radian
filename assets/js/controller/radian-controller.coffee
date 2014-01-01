define [
  'lodash'
  'helper/radian-module-helper'
], (_, hlpr) ->
  class Controller
    @inject: (args...) ->
      hlpr.inject @, args

    @register: (name, deps) ->
      # Check if the user has used this pattern:
      # ```
      # @register '$scope', 'pageTitleFactory'
      # ```
      if _.isString deps
        deps = _.flatten arguments
        name = null

      # Check if the user has used this pattern:
      # ```
      # @register [
      #   '$scope'
      #   'pageTitleFactory'
      # ]
      # ```
      if _.isArray name
        deps = name
        name = null

      # Otherwise assume the user has used this pattern:
      # ```
      # @register 'appController', [
      #   '$scope'
      #   'pageTitleFactory'
      # ]
      # ```

      @inject.apply @, deps
      hlpr.register @, 'controller', name

    constructor: (args...) ->
      hlpr.construct @, args