module.exports = (grunt) ->
  grunt.config 'stylus',
      dev:
        files:
          'assets/css/styles.css': 'assets/css/styles.stylus'
        options:
          firebug: true
          linenos: true
      prod:
        files: '<%= stylus.dev.files %>'
        options:
          compress: true
          force: true

  grunt.loadNpmTasks 'grunt-contrib-stylus'