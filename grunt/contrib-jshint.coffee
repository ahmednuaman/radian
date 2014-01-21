module.exports = (grunt) ->
  grunt.config 'jshint',
    all: [
      'assets/js/**/*.js'
    ]
    options:
      jshintrc: true

  grunt.loadNpmTasks 'grunt-contrib-jshint'