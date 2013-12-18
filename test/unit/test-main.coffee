tests = []

tests.push file for own file, time of window.__karma__.files when ~file.indexOf '-spec.js'

require.config
  baseUrl: '/base/assets/js/'
  deps: tests
  paths:
    'angular': '../vendor/angular/angular'
    'angular-mocks': '../vendor/angular-mocks/angular-mocks'
    'angular-resource': '../vendor/angular-resource/angular-resource'
    'angular-route': '../vendor/angular-route/angular-route'
    'lodash': '../vendor/lodash/dist/lodash'
  shim:
    'angular':
      exports: 'angular'
    'lodash':
      exports: '_'

require ['config', 'angular'], (cfg, A) ->
  require ['angular-mocks', 'angular-resource', 'angular-route'], () ->
    A.module cfg.ngApp, ['ngMock', 'ngResource', 'ngRoute']
    A.bootstrap document, [cfg.ngApp]

    require tests, () ->
      window.__karma__.start()