module.exports = (grunt) ->
  grunt.config 'copy',
    prod:
      files: [
          src: [
            'index.html'
            'assets/font/*'
            'assets/img/*.png'
            'assets/partial/**/*.html'
          ]
          dest: 'build/'
        ,
          src: '<%= compass.dev.options.sassDir %>/styles.css'
          dest: 'build/assets/css/styles-<%= grunt.config.get("git-commit") %>.css'
      ]

  grunt.loadNpmTasks 'grunt-contrib-copy'