module.exports = (grunt) ->
  grunt.config 'express',
    all:
      options:
        opts: ['node_modules/coffee-script/bin/coffee']
        script: './server.coffee'
        port: 8000

  grunt.loadNpmTasks 'grunt-express-server'