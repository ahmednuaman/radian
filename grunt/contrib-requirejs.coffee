module.exports = (grunt) ->
  grunt.config 'requirejs',
    prod:
      options:
        baseUrl: 'assets/js'
        name: 'app'
        out: 'build/assets/js/app-<%= grunt.config.get("git-commit") %>.js'
        include: [
          'startup'
        ]
        paths:
          'angular': 'empty:'
          'angular-resource': 'empty:'
          'angular-route': 'empty:'
          'lodash': 'empty:'

  grunt.loadNpmTasks 'grunt-contrib-requirejs'