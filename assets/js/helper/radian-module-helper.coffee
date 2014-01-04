define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
    # Specifically set types.
    type:
      controller
      directive
      factory
      filter
      service

    construct: (module, args) ->
      # Takes the `$inject` dependancies and assigns a class-wide (`@`) variable to each one.
      _.forEach module.constructor.$inject, (key, i) ->
        module[key] = args[i]

      module.init?()

    inject: (module, deps) ->
      # Takes `deps` and creates a `$inject` var for [AngularJS](http://docs.angularjs.org/guide/di) to read.
      # This is better for minification.
      module.$inject = _.toArray deps

    register: (type, name, deps, module) ->
      # Inject the `deps`.
      helper.inject module, deps

      # Register the module.
      app = A.module cfg.ngApp
      app[type] name, module

    uppercaseFirstLetter: (str) ->
      str.charAt(0).toUpperCase() + str.slice 1

  # Add a dash of specific register functions keep our code tidy and small
  _.forEach helper.type, (v, type) ->
    helper['register' + helper.uppercaseFirstLetter(type)] = (args) ->
      helper.register.apply @, [type].concat _.toArray args

  helper