module.exports = (grunt) ->
  grunt.config 'stylus',
      dev:
        files:
          'assets/css/styles.css': 'assets/styl/styles.styl'
        options:
          firebug: true
          linenos: true
      prod:
        files: '<%= stylus.dev.files %>'
        options:
          force: true

  grunt.loadNpmTasks 'grunt-contrib-stylus'