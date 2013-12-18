module.exports = (config) ->
  exclude = (path) ->
    pattern: path
    included: false

  config.set
    basePath: '../../'
    browsers: [
      if process.env.TRAVIS then 'PhantomJS' else 'Chrome'
    ]
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
      type: 'html'
    junitReporter:
      outputFile: 'test/report/karma-unit.xml'
    logLevel: config.LOG_INFO