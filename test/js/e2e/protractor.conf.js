var config,
    onPrepare;

onPrepare = function() {
  var dir,
      wrench;

  require('jasmine-reporters');

  wrench = require('wrench');
  dir = 'test/report/protractor/';
  global.select = global.by;

  wrench.mkdirSyncRecursive(dir);
  jasmine.getEnv().addReporter(new jasmine.JUnitXmlReporter(dir, true, true));
};

config = {
  framework: 'jasmine',
  onPrepare: onPrepare,
  specs: ['**/*-step.js']
};

if (process.env.TRAVIS) {
  config.sauceUser = process.env.SAUCE_USERNAME;
  config.sauceKey = process.env.SAUCE_ACCESS_KEY;
  config.capabilities = {
    'tunnel-identifier': process.env.TRAVIS_JOB_NUMBER,
    build: process.env.TRAVIS_BUILD_NUMBER,
    name: 'Radian build ' + process.env.TRAVIS_BUILD_NUMBER
  };
}

exports.config = config;