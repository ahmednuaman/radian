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
    'githash'
    'install'
    'sprite'
    'compass:dev'
    # 'less:dev'
    # 'stylus:dev'
    'coffee:dev'
    'jade:dev'
    'express'
    'watch'
  ]

  # ## grunt test
  # This task runs both the unit and e2d tests.
  grunt.registerTask 'test', 'compile the app and run the tests', [
    'githash'
    'install'
    'sprite'
    'compass:dev'
    # 'less:dev'
    # 'stylus:dev'
    'coffeelint'
    'coffee:dev'
    'karma'
    'coffee:e2e'
    'jade:dev'
    'express'
    'exec:e2e'
  ]

  # ## grunt unit
  # This task runs the unit tests in [karma](http://karma-runner.github.io).
  grunt.registerTask 'unit', 'run unit tests', [
    'githash'
    'install'
    'coffeelint'
    'coffee:dev'
    'karma'
  ]

  # ## grunt e2e
  # This task runs the e2e tests in [protractor](https://github.com/angular/protractor).
  grunt.registerTask 'e2e', 'run e2e tests', [
    'githash'
    'install'
    'sprite'
    'compass:dev'
    # 'less:dev'
    # 'stylus:dev'
    'coffeelint'
    'coffee:dev'
    'coffee:e2e'
    'jade:dev'
    'express'
    'exec:e2e'
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
  grunt.registerTask 'build', 'build and package the app', [
    'githash'
    'install'
    'sprite'
    'compass:prod'
    # 'less:prod'
    # 'stylus:prod'
    'imagemin'
    'jade:prod'
    'coffee:prod'
    'ngtemplates'
    'requirejs'
    'copy'
    'express'
    'exec:crawl'
    'replace'
  ]