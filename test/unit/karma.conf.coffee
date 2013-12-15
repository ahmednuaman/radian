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
    preprocessors:
      'assets/js/**/*.js': 'coverage'
    reporters: [
      'coverage'
      'junit'
      'progress'
    ]
    coverageReporter:
      dir: 'test/report/coverage'
      file: 'test/report/karma-coverage.xml'
      type: 'cobertura'
    junitReporter:
      outputFile: 'test/report/karma-unit.xml'
    logLevel: config.LOG_INFO