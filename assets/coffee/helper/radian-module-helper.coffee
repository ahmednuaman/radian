define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
    construct: (funcs) ->
      Klass = () ->
        args = _.toArray arguments
        # Takes the `$inject` dependancies and assigns a class-wide (`@`) variable to each one.
        _.forEach Klass.$inject, (key, i) =>
          @[key] = args[i]

        # If there's an `init` function then run it
        @init?()
        return

      # Takes all the functions in the 'Class' object and assigns them to our temp 'Klass'
      _.assign Klass.prototype, funcs

      # Return the 'Klass'
      Klass

    inject: (module, deps) ->
      # Takes `deps` and creates a `$inject` var for [AngularJS](http://docs.angularjs.org/guide/di) to read.
      # This is better for minification.
      module.$inject = _.toArray deps

    register: (type, name, deps, module) ->
      # Inject the `deps`.
      helper.inject module, deps

      # Register the module.
      A.module(cfg.ngApp)[type] name, module

    registerClass: (type) ->
      # Create a stub controller, this helps keep file size down.
      (args) ->
        # Grab the 'Klass' as the function reference since `args[1]` is the name and `args[2]` are the functions
        args[2] = helper.construct args[2]

        helper.registerModule args, type

    registerFunction: (type) ->
      (args) ->
        helper.registerModule args, type

    registerModule: (args, type) ->
      helper.register.apply @, [type].concat _.toArray args

    uppercaseFirstLetter: (str) ->
      str.charAt(0).toUpperCase() + str.slice 1

  # Add a dash of specific register functions keep our code tidy and small
  _.forEach [
    'controller'
    'directive'
    'factory'
    'filter'
    'service'
  ], (type) ->
    helper['register' + helper.uppercaseFirstLetter(type)] =
      if type is 'controller' or type is 'service'
        helper.registerClass type
      else
        helper.registerFunction type

  helper