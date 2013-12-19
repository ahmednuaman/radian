module.exports = (grunt) ->
  grunt.loadTasks 'grunt'

  grunt.registerTask 'default', 'run the server and watch for changes', [
    'install'
    'compass:dev'
    'coffee:dev'
    'jade:dev'
    'express'
    'watch'
  ]

  grunt.registerTask 'test', 'compile the app and run the tests', [
    'install'
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma'
  ]

  grunt.registerTask 'unit', 'run unit tests', [
    'install'
    'coffeelint'
    'karma:unit'
  ]

  grunt.registerTask 'client', 'run client tests', [
    'install'
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma:client'
  ]

  grunt.registerTask 'install', 'install bower dependancies', () ->
    done = @async()
    config =
      cmd: 'bower'
      args: [
        'install'
      ]

    child = grunt.util.spawn config, (err, result) ->
      done()

    child.stdout.on 'data', (data) ->
      grunt.log.write data

  grunt.registerTask 'build', 'build and package the app', () ->
    done = @async()

    tasks = [
      'install'
      'compass:prod'
      'imagemin'
      'coffee:prod'
      'requirejs'
      'jade:prod'
      'copy'
      'replace'
      # 'express'
      # 'exec'
    ]

    config =
      cmd: 'git'
      args: [
        'rev-parse'
        '--verify'
        'HEAD'
      ]

    grunt.util.spawn config, (err, result) ->
      grunt.config 'git-commit', result.stdout

      grunt.file.delete './build',
        force: true

      grunt.task.run tasks

      done()