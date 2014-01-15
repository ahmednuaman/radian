module.exports = (grunt) ->
  grunt.config 'cmq',
    prod:
      files:
        'assets/css/': ['assets/css/styles.css']

  grunt.loadNpmTasks 'grunt-combine-media-queries'