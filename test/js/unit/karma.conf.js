module.exports = function(config) {
  var browsers = ['PhantomJS'],
      exclude;

  if (!process.env.TRAVIS) {
    browsers.push('Chrome', 'Firefox');
  }

  exclude = function(path) {
    return {
      pattern: path,
      included: false
    };
  };

  config.set({
    basePath: '../../',
    browsers: browsers,
    files: [
      exclude('assets/vendor/**/*.js'),
      exclude('assets/js/**/*.js'),
      exclude('test/unit/**/*-spec.js'),
      'test/unit/test-main.js'
    ],
    exclude: ['assets/js/app.js'],
    frameworks: [
      'jasmine',
      'requirejs'
    ],
    preprocessors: {
      'assets/js/**/*.js': 'coverage'
    },
    reporters: [
      'coverage',
      'junit',
      'progress'
    ],
    coverageReporter: {
      dir: 'test/report/coverage',
      reporters: [
        {
          type: 'html'
        }, {
          type: 'text-summary'
        }
      ]
    },
    junitReporter: {
      outputFile: 'test/report/karma-unit.xml'
    },
    logLevel: config.LOG_INFO
  });
};