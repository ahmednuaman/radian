define([
  'config',
  'angular',
  'lodash'
], function(cfg, A, _) {
  var helper = {
    construct: function(module, args) {
      _.forEach(module.constructor.$inject, function(key, i) {
        return module[key] = args[i];
      });

      if (typeof module.init === 'function') {
        module.init();
      }
    },

    inject: function(module, deps) {
      module.$inject = _.toArray(deps);
    },

    register: function(type, name, deps, module) {
      helper.inject(module, deps);
      A.module(cfg.ngApp)[type](name, module);
    },

    uppercaseFirstLetter: function(str) {
      return str.charAt(0).toUpperCase() + str.slice(1);
    }
  };

  _.forEach([
    'controller',
    'directive',
    'factory',
    'filter',
    'service'
  ], function(type) {
    helper['register' + helper.uppercaseFirstLetter(type)] = function(args) {
      helper.register.apply(this, [type].concat(_.toArray(args)));
    };
  });

  return helper;
});