module.exports = (grunt) ->
  grunt.config 'less',
      dev:
        files:
          'assets/css/styles.css': '<%= less.dev.options.paths[0] %>/styles.less'
        options:
          paths: ['assets/less']
          dumpLineNumbers: 'all'
          sourceMap: true
      prod:
        files: '<%= less.dev.files %>'
        options:
          force: true

  grunt.loadNpmTasks 'grunt-contrib-less'