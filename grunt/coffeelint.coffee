module.exports = (grunt) ->
  grunt.config 'coffeelint',
    all: [
      'assets/js/**/*.coffee'
      'test/unit/**/*.coffee'
      'Gruntfile.coffee'
    ]
    options:
      max_line_length:
        value: 120
        level: 'warn'

  grunt.loadNpmTasks 'grunt-coffeelint'