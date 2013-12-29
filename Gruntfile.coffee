# If you're new to [Grunt](http://gruntjs.com) then get yourself over to the
# ['getting started'](http://gruntjs.com/getting-started) section on their site.
module.exports = (grunt) ->
  # To keep this file as minimal as possible the [NPM](http://npmjs.org) tasks are stored in the `./grunt/` folder as
  # individual files for each task.
  grunt.loadTasks 'grunt'

  # ## grunt default
  # This task is useful for running whilst you're developing your app. It installs the [Bower](http://bower.io)
  # dependancies, runs the development preprocessor tasks, starts the local express server and watches your files
  # as you code your awsome app.
  grunt.registerTask 'default', 'run the server and watch for changes', [
    'install'
    'compass:dev'
    'coffee:dev'
    'jade:dev'
    'express'
    'watch'
  ]

  # ## grunt test
  # This task runs both the unit and client tests in [karma](http://karma-runner.github.io).
  grunt.registerTask 'test', 'compile the app and run the tests', [
    'install'
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma'
  ]

  # ## grunt unit
  # This task runs the unit tests in karma.
  grunt.registerTask 'unit', 'run unit tests', [
    'install'
    'coffeelint'
    'coffee:dev'
    'karma:unit'
  ]

  # ## grunt client
  # This task runs the client tests in karma.
  grunt.registerTask 'client', 'run client tests', [
    'install'
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma:client'
  ]

  # ## grunt install
  # This task installs the bower dependancies.
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

  # ## grunt build
  # This task builds the app. It starts by running all the preprocessors in production mode, compressing the images
  # and packages up the app using the awesome [`r.js`](http://requirejs.org/docs/optimization.html) optimiser.
  # It then copies files into place (by default into the `./build/` directory) and replaces the bower libraries with
  # CDN versions. Finally it executes the crawler to make the app SEO friendly.
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
      'express'
      'exec'
      'replace'
    ]

    config =
      cmd: 'git'
      args: [
        'rev-parse'
        '--verify'
        'HEAD'
      ]

    grunt.util.spawn config, (err, result) ->
      # To deal with cache busting this task grabs the latest git commit sha1 and uses this for naming the optimised
      # CSS and JS files.
      grunt.config 'git-commit', result.stdout

      grunt.file.delete './build',
        force: true

      grunt.task.run tasks

      done()