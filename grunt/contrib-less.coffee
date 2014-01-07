module.exports = (grunt) ->
  grunt.config 'less',
      dev:
        files:
          '<%= less.dev.options.paths[0] %>/styles.css': '<%= less.dev.options.paths[0] %>/styles.less'
        options:
          paths: ['assets/css']
          sourceMap: true
      prod:
        files: '<%= less.dev.files %>'
        options:
          cleancss: true
          force: true

  grunt.loadNpmTasks 'grunt-contrib-less'