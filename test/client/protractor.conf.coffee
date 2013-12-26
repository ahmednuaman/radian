require 'coffee-script'
require 'jasmine-reporters'

onPrepare = () ->
  # https://github.com/angular/protractor/issues/38#issuecomment-29801069
  global.select = global.by

  # https://github.com/angular/protractor/issues/268
  jasmine.getEnv().addReporter new jasmine.JUnitXmlReporter '../report/protractor/'


exports.config =
  onPrepare: onPrepare
  preprocessors:
    '**/*.coffee': 'coffee'
  specs: [
    '**/*-step.coffee'
  ]