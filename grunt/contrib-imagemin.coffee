module.exports = (grunt) ->
  grunt.config 'imagemin',
    prod:
      files: [
        expand: true
        cwd: 'assets/img/'
        dest: 'build/<%= imagemin.prod.files[0].cwd %>'
        src: [
          '*.{png,gif}'
          '**/*.jpg'
        ]
      ]

  grunt.loadNpmTasks 'grunt-contrib-imagemin'