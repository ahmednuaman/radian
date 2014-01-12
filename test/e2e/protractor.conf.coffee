onPrepare = () ->
  require 'jasmine-reporters'
  wrench = require 'wrench'

  dir = 'test/report/protractor/'

  # https://github.com/angular/protractor/issues/38#issuecomment-29801069
  global.select = global.by

  wrench.mkdirSyncRecursive dir

  # https://github.com/angular/protractor/issues/268
  jasmine.getEnv().addReporter new jasmine.JUnitXmlReporter dir, true, true

config =
  framework: 'jasmine'
  onPrepare: onPrepare
  specs: [
    '**/*-step.js'
  ]

# If this is running on [Travis](http://travis-ci.org) then we add additional details to run the tests on the
# [Sauce labs](https://saucelabs.com/opensource/travis) cloud.
if process.env.TRAVIS
  config.sauceUser = process.env.SAUCE_USERNAME
  config.sauceKey = process.env.SAUCE_ACCESS_KEY
  config.capabilities =
    'tunnel-identifier': process.env.TRAVIS_JOB_NUMBER
    build: process.env.TRAVIS_BUILD_NUMBER
    name: "Radian build #{process.env.TRAVIS_BUILD_NUMBER}"

exports.config = config