module.exports = (grunt) ->
  grunt.config 'clean',
    all: [
      'assets/css'
      'assets/js'
      # Specifically for sprites since they're generated like `name-githash.png`.
      'assets/img/*-*.png'
      'build'
      'docs'
      'test/report/*'
    ]

  grunt.loadNpmTasks 'grunt-contrib-clean'