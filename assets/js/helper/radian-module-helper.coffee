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

    bindAll: (module) ->
      # If called this will [`A.bind`](http://docs.angularjs.org/api/angular.bind) on all the `module`'s functions.
      _.forEach module.constructor.prototype, (fn, key) ->
        return unless _.isFunction fn
        return if key in ['constructor', 'init'] or key[0] is '_'
        module.$scope[key] = module.constructor.prototype[key] = A.bind module, fn

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