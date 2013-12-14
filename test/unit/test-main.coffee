tests = []

tests.push file for own file, time of window.__karma__.files when ~file.indexOf '-spec.js'

require.config
  baseUrl: '/base/assets/js/'
  callback: window.__karma__.start
  deps: tests
  paths:
    'angular': '../vendor/angular/angular'
    'angular-resource': '../vendor/angular-resource/angular-resource'
    'angular-route': '../vendor/angular-route/angular-route'
    'lodash': '../vendor/lodash/dist/lodash'
  shim:
    'angular':
      exports: 'angular'
    'angular-resource':
      exports: 'angular-resource'
    'angular-route':
      exports: 'angular-route'
    'lodash':
      exports: '_'