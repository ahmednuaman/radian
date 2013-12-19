module.exports = (grunt) ->
  grunt.config 'docco',
    all:
      src: ['<%= coffeelint.all %>']
      options:
        layout: 'classic'
        output: 'docs/'

  grunt.loadNpmTasks 'grunt-docco'