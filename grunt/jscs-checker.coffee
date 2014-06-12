module.exports = (grunt) ->
  grunt.config 'jscs',
    src: [
      '<%= watch.js.files %>'
    ],
    options:
      config: '.jscsrc'

  grunt.loadNpmTasks 'grunt-jscs-checker'
