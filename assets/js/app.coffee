require.config
  baseUrl: '/assets/js/'
  paths:
    'angular': '../vendor/angular/angular'
  shim:
    'angular':
      exports: 'angular'

require ['startup']