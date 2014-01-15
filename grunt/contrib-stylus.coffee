module.exports = (grunt) ->
  grunt.config 'stylus',
      dev:
        files:
          '<%= copy.prod.files[1].src %>': 'assets/styl/styles.styl'
        options:
          firebug: true
          linenos: true
      prod:
        files: '<%= stylus.dev.files %>'
        options:
          force: true

  grunt.loadNpmTasks 'grunt-contrib-stylus'