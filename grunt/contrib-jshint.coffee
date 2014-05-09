module.exports = (grunt) ->
  grunt.config 'jshint',
    all: [
      '<%= watch.js.files %>'
    ]
    options:
      jshintrc: true

  grunt.loadNpmTasks 'grunt-contrib-jshint'