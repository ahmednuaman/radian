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
      exclude 'assets/js/**/*.coffee'
      exclude 'test/unit/**/*-spec.coffee'
      'test/unit/test-main.coffee'
    ]
    exclude: [
      'assets/js/app.coffee'
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
      dir: 'test/report/coverage/html'
      type: 'html'
    junitReporter:
      outputFile: 'test/report/karma-unit.xml'
    logLevel: config.LOG_INFO