module.exports = (grunt) ->
  grunt.config 'requirejs',
    prod:
      options:
        baseUrl: 'assets/js'
        name: 'app'
        out: 'build/assets/js/app-<%= grunt.config("git-commit") %>.js'
        findNestedDependencies: true
        optimize: 'uglify2'
        paths:
          'angular': 'empty:'
          'angular-animate': 'empty:'
          'angular-resource': 'empty:'
          'angular-route': 'empty:'
          'lodash': 'empty:'

  grunt.loadNpmTasks 'grunt-contrib-requirejs'
