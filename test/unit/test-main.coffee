# Since the app uses [RequireJS](http://requirejs.org) it makes sense to also use RequireJS for the unit tests too.
# In order to do this this main file is used to load the dependancies of the app and the tests via RequireJS.
tests = []

tests.push file for own file, time of window.__karma__.files when ~file.indexOf '-spec.js'

require.config
  baseUrl: '/base/assets/js/'
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
      # Only when the tests have been loaded is it all ready to go.
      window.__karma__.start()