module.exports = (grunt) ->
  grunt.config 'watch',
    coffee:
      files: [
        '<%= coffeelint.all %>'
      ]
      tasks: [
        'coffeelint'
        'coffee:dev'
      ]
      options:
        livereload: true
    compass:
      files: [
        '<%= compass.dev.options.sassDir %>/**/*.sass'
        '<%= compass.dev.options.imagesDir %>/**/*.png'
      ]
      tasks: [
        'compass:dev'
      ]
      options:
        livereload: true
    jade:
      files: [
        '*.jade'
        'assets/partial/**/*.jade'
      ]
      tasks: [
        'jade'
      ]
      options:
        livereload: true

  grunt.loadNpmTasks 'grunt-contrib-watch'