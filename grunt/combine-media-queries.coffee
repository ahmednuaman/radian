module.exports = (grunt) ->
  grunt.config 'cmq',
    prod:
      files:
        'assets/css/': ['<%= copy.prod.files[1].src %>']

  grunt.loadNpmTasks 'grunt-combine-media-queries'