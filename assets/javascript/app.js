require.config({
  baseUrl: '/assets/js/',
  paths: {
    'angular': '../vendor/angular/angular',
    'angular-animate': '../vendor/angular-animate/angular-animate',
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

require(['startup']);