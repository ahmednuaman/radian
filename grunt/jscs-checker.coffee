module.exports = (grunt) ->
  grunt.config 'jscs',
    src: [
      '<%= jshint.all %>'
    ]

  grunt.loadNpmTasks 'grunt-jscs-checker'