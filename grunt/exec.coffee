module.exports = (grunt) ->
  grunt.config 'exec',
    crawl:
      cmd: 'phantomjs crawler.coffee http://localhost:8000/ build/ 3000 "docs|test"'

  grunt.loadNpmTasks 'grunt-exec'