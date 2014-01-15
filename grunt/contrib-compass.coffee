module.exports = (grunt) ->
  grunt.config 'compass',
      dev:
        options:
          sassDir: 'assets/sass'
          # sassDir: 'assets/scss'
          cssDir: 'assets/css'
          fontsDir: 'assets/font'
          outputStyle: 'expanded'
          noLineComments: false
          imagesDir: 'assets/img'
          debugInfo: true
      prod:
        options:
          sassDir: '<%= compass.dev.options.sassDir %>'
          cssDir: '<%= compass.dev.options.cssDir %>'
          fontsDir: '<%= compass.dev.options.fontsDir %>'
          environment: 'production'
          imagesDir: '<%= compass.dev.options.imagesDir %>'
          force: true

  grunt.loadNpmTasks 'grunt-contrib-compass'