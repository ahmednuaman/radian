module.exports = (grunt) ->
  grunt.config 'jscs',
    src: [
      'assets/js/**/*.js'
    ]

  grunt.loadNpmTasks 'grunt-jscs-checker'