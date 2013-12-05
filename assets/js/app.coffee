require.config
  baseUrl: '/assets/js/'
  paths:
    'angular': '../vendor/angular/angular'
    'angular-route': '../vendor/angular-route/angular-route'
  shim:
    'angular':
      exports: 'angular'
    'angular-route':
      exports: 'angular-route'

require ['startup']