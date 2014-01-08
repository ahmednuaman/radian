module.exports = (grunt) ->
  grunt.config 'coffee',
    dev:
      expand: true
      cwd: 'assets/coffee/'
      dest: 'assets/js/'
      ext: '.js'
      src: [
        '**/*.coffee'
      ]
      options:
        bare: true
        sourceMap: true
    e2e:
      expand: '<%= coffee.dev.expand %>'
      cwd: 'test/e2e/'
      dest: '<%= coffee.e2e.cwd %>'
      ext: '<%= coffee.dev.ext %>'
      src: ['<%= coffee.dev.src %>']
    prod:
      expand: '<%= coffee.dev.expand %>'
      cwd: '<%= coffee.dev.cwd %>'
      dest: '<%= coffee.dev.dest %>'
      ext: '<%= coffee.dev.ext %>'
      src: ['<%= coffee.dev.src %>']

  grunt.loadNpmTasks 'grunt-contrib-coffee'