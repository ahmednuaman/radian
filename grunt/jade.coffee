module.exports = (grunt) ->
  grunt.config 'jade',
    dev:
      options:
        basePath: './'
        extension: '.html'
        client: false
        pretty: true
      files:
        './': ['<%= watch.jade.files %>']
    prod:
      options:
        basePath: '<%= jade.dev.options.basePath %>'
        extension: '<%= jade.dev.options.extension %>'
        client: '<%= jade.dev.options.client %>'
        pretty: false
      files: '<%= jade.dev.files %>'

  grunt.loadNpmTasks 'grunt-jade'