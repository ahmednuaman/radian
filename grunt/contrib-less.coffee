module.exports = (grunt) ->
  grunt.config 'less',
      dev:
        files:
          'assets/css/styles.css': '<%= less.dev.options.paths[0] %>/styles.less'
        options:
          paths: ['assets/less']
          sourceMap: true
      prod:
        files: '<%= less.dev.files %>'
        options:
          cleancss: true
          force: true

  grunt.loadNpmTasks 'grunt-contrib-less'