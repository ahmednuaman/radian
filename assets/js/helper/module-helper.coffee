define [
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
    parseFunctionName: (cls) ->
      # Parses the class name manually from the string of the function definition. We only do this if we are using a
      # version of Coffeescript that doesn't have the function name defined on the `.name` attribute.
      /\W*function\s+([\w\$]+)\(/.exec(cls)[1]

    register: (cls, type, name) ->
      app = A.module cfg.ngApp
      app[type] (name || cls.name || cls.parseFunctionName cls), cls

    inject: (cls, deps) ->
      cls.$inject = _.toArray deps

    construct: (cls, args) ->
      _.forEach cls.constructor.$inject, (key, i) =>
        cls[key] = args[i]

      cls.init?()

    bindAll: (cls) ->
      _.forEach cls.constructor.prototype, (key, fn) ->
        return unless typeof fn is 'function'
        return if key in ['constructor', 'init'] or key[0] is '_'
        cls.$scope[key] = cls.constructor.prototype[key] = fn.bind?(cls) || _.bind fn, cls