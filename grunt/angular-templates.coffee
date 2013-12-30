module.exports = (grunt) ->
  cs = require 'coffee-script'

  grunt.config 'ngtemplates',
    prod:
      src: 'assets/partial/**/*.html'
      dest: 'assets/js/partials.js'
      options:
        bootstrap: (module, script) ->
          src = grunt.config 'ngtemplates.prod.dest'
          file = grunt.file.read src.replace '.js', '.coffee'
          template = cs.compile file
          template.replace 'return \'#{script}\'', script
        htmlmin:
          collapseBooleanAttributes: true
          collapseWhitespace: true
          removeComments: true
          removeEmptyAttributes: true
        prefix: '/'

  grunt.loadNpmTasks 'grunt-angular-templates'