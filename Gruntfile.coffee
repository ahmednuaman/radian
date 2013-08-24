module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      dev:
        expand: true
        cwd: 'assets/js/'
        dest: '<%= coffee.dev.cwd %>'
        ext: '.js'
        src: [
          '*.coffee'
          '**/*.coffee'
        ]
        options:
          sourceMap: true
      prod:
        expand: '<%= coffee.dev.expand %>'
        cwd: '<%= coffee.dev.cwd %>'
        dest: '<%= coffee.dev.cwd %>'
        ext: '<%= coffee.dev.ext %>'
        src: [
          '<%= coffee.dev.src %>'
        ]
    coffeelint:
      all: [
        'assets/js/*.coffee',
        'assets/js/**/*.coffee',
        'Gruntfile.coffee'
      ]
      options:
        max_line_length:
          value: 120
          level: 'warn'
    compass:
      dev:
        options:
          sassDir: 'assets/css'
          cssDir: '<%= compass.dev.options.sassDir %>'
          fontsDir: 'assets/font'
          outputStyle: 'nested'
          noLineComments: false
          imagesDir: 'assets/img'
          debugInfo: false
      prod:
        options:
          sassDir: '<%= compass.dev.options.sassDir %>'
          cssDir: '<%= compass.dev.options.sassDir %>'
          fontsDir: '<%= compass.dev.options.fontsDir %>'
          environment: 'production'
          outputStyle: 'compressed'
          imagesDir: '<%= compass.dev.options.imagesDir %>'
    copy:
      prod:
        files: [
            src: [
              'index.html'
              'assets/font/*'
              'assets/img/*.png'
              'assets/img/*.gif'
              'assets/img/*.jpg'
              'assets/partial/**'
            ]
            dest: 'build/'
          ,
            src: '<%= compass.dev.options.sassDir %>/styles.css'
            dest: 'build/assets/css/styles-<%= grunt.config.get("git-commit") %>.css'
          ,
            expand: true
            cwd: 'node_modules/skystoresignup/build/'
            src: '**'
            dest: 'build/authenticate/'
        ]
    cssmin:
      prod:
        files:
          'build/assets/vendor/normalize-css/normalize.min.css': [
            'assets/vendor/normalize-css/normalize.css'
          ]
    express:
      all:
        options:
          script: './server.js'
          port: 8000
    jade:
      all:
        options:
          basePath: './'
          extension: '.html'
          client: false
          pretty: true
        files:
          './': [
            'index.jade'
            'assets/partial/*.jade'
            'assets/partial/**/*.jade'
          ]
    karma:
      unit:
        configFile: 'test/unit/karma.conf.js'
        singleRun: true
      client:
        configFile: 'test/client/karma.conf.js'
        singleRun: true
    'regex-replace':
      all:
        src: [
          'build/index.html'
        ]
        actions: [
            name: 'app'
            search: 'js/app'
            replace: 'js/app-<%= grunt.config.get("git-commit") %>'
          ,
            name: 'css'
            search: /styles\.css/
            replace: 'styles-<%= grunt.config.get("git-commit") %>.css'
          ,
            name: 'normalize'
            search: /normalize\.css/
            replace: 'normalize.min.css'
        ]
    requirejs:
      prod:
        options:
          baseUrl: 'assets/js'
          name: 'app'
          out: 'build/assets/js/app-<%= grunt.config.get("git-commit") %>.js'
          include: [
            'controller/app-controller'
          ],
          paths:
            'angular': 'empty:'
    uglify:
      prod:
        files:
          'build/assets/vendor/requirejs/require.js': [
            'assets/vendor/requirejs/require.js'
          ]
          'build/assets/vendor/angular/angular.js': [
            'assets/vendor/angular/angular.js'
          ]
    watch:
      coffee:
        files: [
          '<%= coffeelint.all %>'
        ]
        tasks: [
          'coffeelint'
          'coffee'
        ]
        options:
          livereload: true
      compass:
        files: [
          '<%= compass.dev.options.sassDir %>/**/*.sass',
          '<%= compass.dev.options.imagesDir %>/**/*.png'
        ]
        tasks: [
          'compass:dev'
        ]
        options:
          livereload: true
      jade:
        files: [
          'assets/partial/*.jade'
          'assets/partial/**/*.jade'
          '*.jade'
        ]
        tasks: [
          'jade'
        ]
        options:
          livereload: true

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-regex-replace'

  grunt.registerTask 'default', 'run the server and watch for changes', [
    'compass:dev'
    'coffee:dev'
    'jade'
    'express'
    'watch'
  ]

  grunt.registerTask 'test', 'compile the app and run the tests', [
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma'
  ]

  grunt.registerTask 'unit', 'run unit tests', [
    'coffeelint'
    'coffee:dev'
    'karma:unit'
  ]

  grunt.registerTask 'client', 'run client tests', [
    'compass:dev'
    'coffeelint'
    'coffee:dev'
    'express'
    'karma:client'
  ]

  grunt.registerTask 'install', 'install bower dependancies', () ->
    done = @async()
    config =
      cmd: 'bower'
      args: [
        'install'
      ]

    child = grunt.util.spawn config, (err, result) ->
      done()

    child.stdout.on 'data', (data) ->
      grunt.log.write data

  grunt.registerTask 'package', 'package the app', (target) ->
    done = @async()

    tasks = [
      'install'
      'compass:prod'
      'coffee:prod'
      'cssmin'
      'uglify'
      'requirejs'
      'copy'
      'regex-replace:all'
    ]

    if target
      tasks.push 'regex-replace:' + target

    config =
      cmd: 'git'
      args: [
        'rev-parse'
        '--verify'
        'HEAD'
      ]

    grunt.util.spawn config, (err, result) ->
      grunt.config 'git-commit', result.stdout

      grunt.file.delete './build',
        force: true

      grunt.task.run tasks

      done()