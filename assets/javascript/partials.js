define([
  'config',
  'angular'
], function(cfg, A) {
  var app,
      partials;

  partials = function($templateCache) {
    return '#{script}';
  };

  partials.$inject = ['$templateCache'];

  app = A.module(cfg.ngApp);
  app.run(partials);
});