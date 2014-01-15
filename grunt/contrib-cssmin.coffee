module.exports = (grunt) ->
  grunt.config 'cssmin',
    prod:
      files:
        '<%= copy.prod.files[1].src %>': ['<%= copy.prod.files[1].src %>']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'