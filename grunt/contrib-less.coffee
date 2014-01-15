module.exports = (grunt) ->
  grunt.config 'less',
      dev:
        files:
          '<%= copy.prod.files[1].src %>': '<%= less.dev.options.paths[0] %>/styles.less'
        options:
          paths: ['assets/less']
          dumpLineNumbers: 'all'
          sourceMap: true
      prod:
        files: '<%= less.dev.files %>'
        options:
          cleancss: true
          force: true

  grunt.loadNpmTasks 'grunt-contrib-less'