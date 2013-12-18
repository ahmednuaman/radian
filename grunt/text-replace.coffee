module.exports = (grunt) ->
  grunt.config 'replace',
    app:
      src: ['build/assets/js/*.js']
      overwrite: true
      replacements: [
          from: '../vendor/angular/angular'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min.js'
        ,
          from: '../vendor/angular-resource/angular-resource'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular-resource.min.js'
        ,
          from: '../vendor/angular-route/angular-route'
          to: '//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular-route.min.js'
        ,
          from: '../vendor/lodash/lodash'
          to: '//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min.js'
        ,
      ]
    html:
      src: ['build/index.html']
      overwrite: true
      replacements: [
          from: 'js/app'
          to: 'js/app-<%= grunt.config.get("git-commit") %>'
        ,
          from: 'styles.css'
          to: 'styles-<%= grunt.config.get("git-commit") %>.css'
        ,
          from: '/assets/vendor/normalize-css/normalize.css'
          to: '//cdnjs.cloudflare.com/ajax/libs/normalize/2.1.3/normalize.min.css'
        ,
          from: '/assets/vendor/requirejs/require.js'
          to: '//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.9/require.min.js'
      ]

  grunt.loadNpmTasks 'grunt-text-replace'