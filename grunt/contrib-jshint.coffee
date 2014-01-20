module.exports = (grunt) ->
  grunt.config 'jshint',
    all: [
      'assets/javascript/**/*.js'
    ]
    options:
      jshintrc: true

  grunt.loadNpmTasks 'grunt-contrib-jshint'