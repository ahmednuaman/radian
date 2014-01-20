define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
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
      (A.module cfg.ngApp)[type] name, module

    registerClass: (type) ->
      # Create a stub controller, this helps keep file size down.
      () ->
        class
          @register: (name, deps) ->
            helper.register type, name, deps, @

          constructor: () ->
            helper.construct @, arguments

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