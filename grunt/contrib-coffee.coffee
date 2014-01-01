module.exports = (grunt) ->
  grunt.config 'coffee',
    dev:
      expand: true
      cwd: './'
      dest: '<%= coffee.dev.cwd %>'
      ext: '.js'
      src: ['<%= watch.coffee.files %>']
      options:
        bare: true
        sourceMap: true
    e2e:
      expand: '<%= coffee.dev.expand %>'
      cwd: '<%= coffee.dev.cwd %>'
      dest: '<%= coffee.dev.cwd %>'
      ext: '<%= coffee.dev.ext %>'
      src: [
        'test/e2e/**/*.coffee'
      ]
    prod:
      expand: '<%= coffee.dev.expand %>'
      cwd: '<%= coffee.dev.cwd %>'
      dest: '<%= coffee.dev.cwd %>'
      ext: '<%= coffee.dev.ext %>'
      src: ['<%= coffee.dev.src %>']

  grunt.loadNpmTasks 'grunt-contrib-coffee'