define([
  'lodash',
  'helper/radian-module-helper'
], function(_, helper) {
  return function(name, deps, funcs) {
    helper.registerService(arguments);
  };
});