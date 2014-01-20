module.exports = (grunt) ->
  grunt.config 'jscs',
    src: [
      'assets/javascript/**/*.js'
    ]

  grunt.loadNpmTasks 'grunt-jscs-checker'