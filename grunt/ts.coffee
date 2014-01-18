module.exports = (grunt) ->
  grunt.config 'ts',
    dev:
      outDir: 'assets/js/'
      src: [
        'assets/ts/**/*.ts'
      ]
      options:
        sourceMap: true
    e2e:
      expand: '<%= ts.dev.expand %>'
      cwd: 'test/e2e/'
      dest: '<%= ts.e2e.cwd %>'
      ext: '<%= ts.dev.ext %>'
      src: ['<%= ts.dev.src %>']
    prod:
      expand: '<%= ts.dev.expand %>'
      cwd: '<%= ts.dev.cwd %>'
      dest: '<%= ts.dev.dest %>'
      ext: '<%= ts.dev.ext %>'
      src: ['<%= ts.dev.src %>']

  grunt.loadNpmTasks 'grunt-ts'