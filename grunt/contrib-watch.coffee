module.exports = (grunt) ->
  _ = require 'lodash'

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
        spawn: false
    compass:
      files: [
        '<%= compass.devSASS.options.sassDir %>/**/*.sass'
        # '<%= compass.devSCSS.options.sassDir %>/**/*.scss'
      ]
      tasks: [
        'compass:devSASS'
        # 'compass:devSCSS'
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
    js:
      files: [
        'assets/js/**/*.js'
      ]
      tasks: [
        'jshint'
        'jscs'
      ]
      options:
        livereload: true
        spawn: false
    html:
      files: [
        'assets/partial/**/*.html'
        '*.html'
      ]
      options:
        livereload: true
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
        'assets/styl/**/*.styl'
      ]
      tasks: [
        'stylus:dev'
      ]

  changedFiles = {}
  onChange = _.debounce () ->
    changedCoffeeFiles = changedFiles['coffee']
    changedJadeFiles = changedFiles['jade']
    changedJSFiles = changedFiles['js']

    if changedCoffeeFiles
      grunt.config 'coffeelint.all', changedCoffeeFiles
      grunt.config 'coffee.dev.src', _.map changedCoffeeFiles, (file) ->
        file.replace 'assets/coffee/', ''

    if changedJadeFiles
      grunt.config 'jade.dev.files',
        './': changedJadeFiles

    if changedJSFiles
      grunt.config 'jshint.all', changedJSFiles
      grunt.config 'jscs.src', changedJSFiles

    changedFiles = {}
  , 200

  grunt.event.on 'watch', (action, file) ->
    ext = file.split('.').pop()

    if !changedFiles[ext]
      changedFiles[ext] = []

    changedFiles[ext].push file

    onChange()

  grunt.loadNpmTasks 'grunt-contrib-watch'
