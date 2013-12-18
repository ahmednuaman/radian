module.exports = (grunt) ->
  grunt.config 'karma',
    unit:
      configFile: 'test/unit/karma.conf.coffee'
      singleRun: true
    client:
      configFile: 'test/client/karma.conf.coffee'
      singleRun: true

  grunt.loadNpmTasks 'grunt-karma'