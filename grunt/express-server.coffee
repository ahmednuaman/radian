module.exports = (grunt) ->
  grunt.config 'express',
    all:
      options:
        cmd: 'coffee'
        script: './server.coffee'
        port: 8000

  grunt.loadNpmTasks 'grunt-express-server'