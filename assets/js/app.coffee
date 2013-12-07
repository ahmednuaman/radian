require.config
  baseUrl: '/assets/js/'
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

require ['startup']