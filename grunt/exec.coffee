module.exports = (grunt) ->
  grunt.config 'exec',
    crawl:
      cmd: 'phantomjs crawler.coffee http://localhost:<%= express.all.options.port %>/ build/ 8000 "docs|test"'
    e2e:
      cmd: 'protractor test/e2e/protractor.js'
      stdout: !process.env.TRAVIS

  grunt.loadNpmTasks 'grunt-exec'
