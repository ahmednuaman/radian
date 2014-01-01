define [
  'config'
  'angular'
  'lodash'
], (cfg, A, _) ->
  helper =
    bindAll: (module) ->
      _.forEach module.constructor.prototype, (key, fn) ->
        return unless _.isFunction fn
        return if key in ['constructor', 'init'] or key[0] is '_'
        module.$scope[key] = module.constructor.prototype[key] = fn.bind?(module) || _.bind fn, module

    lowercaseFirstLetter: (str) ->
      str.charAt(0).toLowerCase() + str.slice 1

    construct: (module, args) ->
      _.forEach module.constructor.$inject, (key, i) =>
        module[key] = args[i]

      module.init?()

    inject: (module, deps) ->
      module.$inject = _.toArray deps

    register: (module, type, name) ->
      app = A.module cfg.ngApp
      app[type] helper.lowercaseFirstLetter(name || module.name), module