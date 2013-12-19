module.exports = (grunt) ->
  grunt.config 'coffee',
    dev:
      expand: true
      cwd: './'
      dest: '<%= coffee.dev.cwd %>'
      ext: '.js'
      src: ['assets/js/**/*.coffee']
      options:
        bare: true
        sourceMap: true
    prod:
      expand: '<%= coffee.dev.expand %>'
      cwd: '<%= coffee.dev.cwd %>'
      dest: '<%= coffee.dev.cwd %>'
      ext: '<%= coffee.dev.ext %>'
      src: ['<%= coffee.dev.src %>']

  grunt.loadNpmTasks 'grunt-contrib-coffee'