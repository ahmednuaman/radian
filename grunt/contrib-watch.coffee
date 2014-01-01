module.exports = (grunt) ->
  grunt.config 'watch',
    coffee:
      files: [
        '<%= coffee.dev.src %>'
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
        '<%= compass.dev.options.imagesDir %>/**/*.png'
      ]
      tasks: [
        'compass:dev'
      ]
    css:
      files: [
        '<%= compass.dev.options.sassDir %>/styles.css'
        '<%= compass.dev.options.imagesDir %>/**/*.png'
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
      options:
        livereload: true
        
  changedFiles = []
  onChange = grunt.util._.debounce ->
    changedCoffeeFiles = []

    for filePath in changedFiles
      fileExtension = filePath.split('.').pop()
      if fileExtension is 'coffee'
        changedCoffeeFiles.push filePath

    if changedCoffeeFiles.length
      grunt.config 'coffee.dev.src', changedCoffeeFiles
      grunt.config 'coffeelint.all', changedCoffeeFiles
    
    changedFiles = []
  , 200

  grunt.event.on 'watch', (action, filepath) ->
    changedFiles.push filepath
    onChange()

  grunt.loadNpmTasks 'grunt-contrib-watch'
