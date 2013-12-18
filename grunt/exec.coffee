module.exports = (grunt) ->
  grunt.config 'exec',
    crawl:
      cmd: 'phantomjs crawler.coffee http://localhost:8000/ build/'

  grunt.loadNpmTasks 'grunt-exec'