module.exports = (grunt) ->
  grunt.config 'replace',
    app:
      src: ['build/assets/js/*.js']
      overwrite: true
      replacements: [
          from: '../vendor/angular/angular'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min'
        ,
          from: '../vendor/angular-animate/angular-animate'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min'
        ,
          from: '../vendor/angular-resource/angular-resource'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-resource.min'
        ,
          from: '../vendor/angular-route/angular-route'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-route.min'
        ,
          from: '../vendor/lodash/dist/lodash'
          to: '//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min'
        ,
      ]
    html:
      src: ['build/**/*.html']
      overwrite: true
      replacements: [
          from: 'js/app'
          to: 'js/app-<%= grunt.config("git-commit") %>'
        ,
          from: 'styles.css'
          to: 'styles-<%= grunt.config("git-commit") %>.css'
        ,
          from: '/assets/vendor/normalize-css/normalize.css'
          to: '//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.0/normalize.min.css'
        ,
          from: '/assets/vendor/requirejs/require.js'
          to: '//requirejs.org/docs/release/2.1.11/minified/require.js'
      ]

  grunt.loadNpmTasks 'grunt-text-replace'