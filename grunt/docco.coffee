module.exports = (grunt) ->
  grunt.config 'docco',
    all:
      src: ['<%= coffeelint.all %>']
      options:
        output: 'docs/'

  grunt.loadNpmTasks 'grunt-docco'