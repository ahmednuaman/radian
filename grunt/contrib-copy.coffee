module.exports = (grunt) ->
  grunt.config 'copy',
    prod:
      files: [
          src: [
            'index.html'
            'assets/font/*'
            'assets/img/*.{gif,png,svg}'
            'assets/img/**/*.jpg'
            'data/*'
          ]
          dest: 'build/'
      ]

  grunt.loadNpmTasks 'grunt-contrib-copy'