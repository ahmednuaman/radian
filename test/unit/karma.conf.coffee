# This is the config file for the unit tests for the app. For more info visit the
# [karma config page](http://karma-runner.github.io/0.10/config/configuration-file.html)
module.exports = (config) ->
  browsers = [
    'PhantomJS'
  ]

  # You may not need this but since [Travis](https://travis-ci.org/ahmednuaman/radian) is being used to keep an
  # eye on the code then [PhantomJS](http://phantomjs.org) is used as the runner browser.
  if !process.env.TRAVIS
    browsers.push 'Chrome', 'Firefox'

  exclude = (path) ->
    pattern: path
    included: false

  config.set
    basePath: '../../'
    browsers: browsers
    files: [
      exclude 'assets/vendor/**/*.js'
      exclude 'assets/js/**/*.js'
      exclude 'test/unit/**/*-spec.coffee'
      'test/unit/test-main.coffee'
    ]
    exclude: [
      'assets/js/app.js'
    ]
    frameworks: [
      'jasmine'
      'requirejs'
    ]
    preprocessors:
      'assets/js/**/*.js': 'coverage'
      '**/*.coffee': 'coffee'
    reporters: [
      'coverage'
      'junit'
      'progress'
    ]
    coverageReporter:
      dir: 'test/report/coverage'
      reporters: [
          type: 'html'
        ,
          type: 'text-summary'
      ]
    junitReporter:
      outputFile: 'test/report/karma-unit.xml'
    logLevel: config.LOG_INFO