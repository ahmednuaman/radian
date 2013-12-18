module.exports = (grunt) ->
  grunt.config 'compass',
      dev:
        options:
          sassDir: 'assets/css'
          cssDir: '<%= compass.dev.options.sassDir %>'
          fontsDir: 'assets/font'
          outputStyle: 'nested'
          noLineComments: false
          imagesDir: 'assets/img'
          debugInfo: false
      prod:
        options:
          sassDir: '<%= compass.dev.options.sassDir %>'
          cssDir: '<%= compass.dev.options.sassDir %>'
          fontsDir: '<%= compass.dev.options.fontsDir %>'
          environment: 'production'
          outputStyle: 'compressed'
          imagesDir: '<%= compass.dev.options.imagesDir %>'
          force: true

  grunt.loadNpmTasks 'grunt-contrib-compass'