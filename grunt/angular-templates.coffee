module.exports = (grunt) ->
  grunt.config 'ngtemplates',
    prod:
      src: 'assets/partial/**/*.html'
      dest: 'assets/js/partials.js'
      options:
        bootstrap: (module, script) ->
          """
          define(['config', 'angular'], function(cfg, A) {
            var app = A.module(cfg.ngApp),
                module;

            module = function ($templateCache) {
              console.log('sheeett');
              #{script}
            };

            module.$inject = ['$templateCache'];

            app.run(module);
          });
          """
        htmlmin:
          collapseBooleanAttributes: true
          collapseWhitespace: true
          removeComments: true
          removeEmptyAttributes: true

  grunt.loadNpmTasks 'grunt-angular-templates'