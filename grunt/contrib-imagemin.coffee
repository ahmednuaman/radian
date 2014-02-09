module.exports = (grunt) ->
  grunt.config 'imagemin',
    prod:
      files: [
        expand: true
        cwd: 'assets/img/'
        dest: 'build/<%= imagemin.prod.files[0].cwd %>'
        src: [
          '*.{gif,png}'
          '**/*.jpg'
        ]
      ]

  grunt.loadNpmTasks 'grunt-contrib-imagemin'
