module.exports = (grunt) ->
  grunt.config 'compass',
      dev:
        options:
          sassDir: 'assets/sass'
          # sassDir: 'assets/scss'
          cssDir: 'assets/css'
          fontsDir: 'assets/font'
          outputStyle: 'nested'
          noLineComments: false
          imagesDir: 'assets/img'
          debugInfo: false
      prod:
        options:
          sassDir: '<%= compass.dev.options.sassDir %>'
          cssDir: '<%= compass.dev.options.cssDir %>'
          fontsDir: '<%= compass.dev.options.fontsDir %>'
          environment: 'production'
          outputStyle: 'compressed'
          imagesDir: '<%= compass.dev.options.imagesDir %>'
          force: true

  grunt.loadNpmTasks 'grunt-contrib-compass'