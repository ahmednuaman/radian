module.exports = (grunt) ->
  grunt.config 'jscs',
    src: [
      '<%= watch.js.files %>'
    ]

  grunt.loadNpmTasks 'grunt-jscs-checker'