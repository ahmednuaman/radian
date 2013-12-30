module.exports = (grunt) ->
  grunt.config 'copy',
    prod:
      files: [
          src: [
            # '<%= ngtemplates.prod.src %>'
            'index.html'
            'assets/font/*'
            'assets/img/*.{gif,png,svg}'
            'assets/img/**/*.jpg'
            'data/*'
          ]
          dest: 'build/'
        ,
          src: '<%= compass.dev.options.sassDir %>/styles.css'
          dest: 'build/assets/css/styles-<%= grunt.config.get("git-commit") %>.css'
      ]

  grunt.loadNpmTasks 'grunt-contrib-copy'