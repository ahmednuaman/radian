module.exports = (config) ->
  exclude = (path) ->
    pattern: path
    included: false

  browsers = [
    'FireFox'
  ]

  if !process.env.TRAVIS
    browsers.push 'Chrome'

  config.set
    basePath: '../../'
    browsers: browsers
    files: [
      exclude 'assets/vendor/**/*.js'
      exclude 'assets/js/**/*.js'
      exclude 'test/unit/**/*-spec.js'
      'test/unit/test-main.js'
    ]
    exclude: [
      'assets/js/app.js'
    ]
    frameworks: [
      'jasmine'
      'requirejs'
    ]
    reporters: [
      'junit'
      'progress'
    ]
    junitReporter:
      outputFile: 'test/report/karma-unit.xml'
    logLevel: config.LOG_INFO