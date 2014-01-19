module.exports = (grunt) ->
  grunt.config 'compass',
      devSASS:
        options:
          sassDir: 'assets/sass'
          cssDir: 'assets/css'
          fontsDir: 'assets/font'
          outputStyle: 'expanded'
          noLineComments: false
          imagesDir: 'assets/img'
          debugInfo: true
      devSCSS:
        options:
          sassDir: 'assets/scss'
          cssDir: '<%= compass.devSASS.options.cssDir %>'
          fontsDir: '<%= compass.devSASS.options.fontsDir %>'
          outputStyle: '<%= compass.devSASS.options.outputStyle %>'
          noLineComments: '<%= compass.devSASS.options.noLineComments %>'
          imagesDir: '<%= compass.devSASS.options.imagesDir %>'
          debugInfo: '<%= compass.devSASS.options.debugInfo %>'
      prod:
        options:
          sassDir: '<%= compass.devSASS.options.sassDir %>'
          # sassDir: '<%= compass.devSCSS.options.sassDir %>'
          cssDir: '<%= compass.devSASS.options.cssDir %>'
          fontsDir: '<%= compass.devSASS.options.fontsDir %>'
          environment: 'production'
          imagesDir: '<%= compass.devSASS.options.imagesDir %>'
          force: true

  grunt.loadNpmTasks 'grunt-contrib-compass'