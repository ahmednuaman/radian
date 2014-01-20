var file, tests, time, _ref,
  __hasProp = {}.hasOwnProperty;

tests = [];

_ref = window.__karma__.files;
for (file in _ref) {
  if (!__hasProp.call(_ref, file)) continue;
  time = _ref[file];
  if (~file.indexOf('-spec.js')) {
    tests.push(file);
  }
}

require.config({
  baseUrl: '/base/assets/js/',
  paths: {
    'angular': '../vendor/angular/angular',
    'angular-mocks': '../vendor/angular-mocks/angular-mocks',
    'angular-resource': '../vendor/angular-resource/angular-resource',
    'angular-route': '../vendor/angular-route/angular-route',
    'lodash': '../vendor/lodash/dist/lodash'
  },
  shim: {
    'angular': {
      exports: 'angular'
    },
    'lodash': {
      exports: '_'
    }
  }
});

require(['config', 'angular'], function(cfg, A) {
  require([
    'angular-mocks',
    'angular-resource',
    'angular-route'
  ], function() {
    A.module(cfg.ngApp, [
      'ngMock',
      'ngResource',
      'ngRoute'
    ]);
    A.bootstrap(document, [cfg.ngApp]);

    require(tests, function() {
      window.__karma__.start();
    });
  });
});
