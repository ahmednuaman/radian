define([
  'config',
  'angular',
  'lodash'
], function(cfg, A, _) {
  var helper = {
    construct: function(funcs) {
      function Klass() {
        var args = _.toArray(arguments),
            that = this;

        _.forEach(Klass.$inject, function(key, i) {
          that[key] = args[i];
        });

        if (typeof this.init === 'function') {
          this.init();
        }
      }

      _.assign(Klass.prototype, funcs);

      return Klass;
    },

    inject: function(module, deps) {
      module.$inject = _.toArray(deps);
    },

    register: function(type, name, deps, module) {
      helper.inject(module, deps);
      A.module(cfg.ngApp)[type](name, module);
    },

    registerClass: function(type) {
      return function(args) {
        args[2] = helper.construct(args[2]);

        helper.registerModule(args, type);
      };
    },

    registerFunction: function(type) {
      return function(args) {
        helper.registerModule(args, type);
      };
    },

    registerModule: function(args, type) {
      helper.register.apply(this, [type].concat(_.toArray(args)));
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
    helper['register' + helper.uppercaseFirstLetter(type)] = type === 'controller' || type === 'service' ? helper.registerClass(type) : helper.registerFunction(type);
  });

  return helper;
});