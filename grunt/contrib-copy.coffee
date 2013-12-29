module.exports = (grunt) ->
  grunt.config 'copy',
    prod:
      files: [
          src: [
            'index.html'
            'assets/font/*'
            'assets/img/*.{gif,png,svg}'
            'assets/img/**/*.jpg'
            'assets/partial/**/*.html'
            'data/*'
          ]
          dest: 'build/'
        ,
          src: '<%= compass.dev.options.sassDir %>/styles.css'
          dest: 'build/assets/css/styles-<%= grunt.config.get("git-commit") %>.css'
      ]

  grunt.loadNpmTasks 'grunt-contrib-copy'