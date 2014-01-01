define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
    # Specifically set types.
    type:
      controller: 'controller'
      directive: 'directive'
      factory: 'factory'
      filter: 'filter'
      service: 'service'

    construct: (module, args) ->
      # Takes the `$inject` dependancies and assigns a class-wide (`@`) variable to each one.
      _.forEach module.constructor.$inject, (key, i) ->
        module[key] = args[i]

      module.init?()

    inject: (module, deps) ->
      # Takes `deps` and creates a `$inject` var for [AngularJS](http://docs.angularjs.org/guide/di) to read.
      # This is better for minification.
      module.$inject = _.toArray deps

    register: (module, type, name, deps) ->
      # Inject the `deps`.
      helper.inject module, deps

      # Register the module.
      app = A.module cfg.ngApp
      app[type] name, module