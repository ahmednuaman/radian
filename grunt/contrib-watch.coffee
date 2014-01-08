module.exports = (grunt) ->
  grunt.config 'watch',
    coffee:
      files: [
        'assets/js/**/*.coffee'
      ]
      tasks: [
        'coffeelint'
        'coffee:dev'
      ]
      options:
        livereload: true
        spawn: false
    compass:
      files: [
        '<%= compass.dev.options.sassDir %>/**/*.sass'
        '<%= compass.dev.options.sassDir %>/**/*.scss'
      ]
      tasks: [
        'compass:dev'
      ]
    css:
      files: [
        'assets/css/*.css'
        'assets/img/*.{gif,png,svg}'
        'assets/img/**/*.jpg'
      ]
      options:
        livereload: true
    jade:
      files: [
        '*.jade'
        'assets/partial/**/*.jade'
      ]
      tasks: [
        'jade:dev'
      ]
      options: '<%= watch.coffee.options %>'
    less:
      files: [
        '<%= less.dev.options.paths[0] %>/**/*.less'
      ]
      tasks: [
        'less:dev'
      ]
    sprite:
      files: [
        'assets/img/**/*.png'
      ]
      tasks: [
        'sprite'
      ]
    stylus:
      files: [
        'assets/css/**/*.styl'
      ]
      tasks: [
        'stylus:dev'
      ]

  changedFiles = {}
  onChange = grunt.util._.debounce () ->
    changedCoffeeFiles = changedFiles['coffee']
    changedJadeFiles = changedFiles['jade']

    if changedCoffeeFiles
      grunt.config 'coffee.dev.src', changedCoffeeFiles
      grunt.config 'coffeelint.all', changedCoffeeFiles

    if changedJadeFiles
      grunt.config 'jade.dev.files',
        './': changedJadeFiles

    changedFiles = {}
  , 200

  grunt.event.on 'watch', (action, file) ->
    ext = file.split('.').pop()

    if !changedFiles[ext]
      changedFiles[ext] = []

    changedFiles[ext].push file

    onChange()

  grunt.loadNpmTasks 'grunt-contrib-watch'
