module.exports = (grunt) ->
  config = {}
  targets = [
    'icon'
  ]

  targets.forEach (target) ->
    config[target] =
      src: [
        "assets/img/#{target}/*.png"
      ]
      destImg: "assets/img/#{target}-<%= grunt.config('git-commit') %>.png"
      imgPath: "../img/#{target}-<%= grunt.config('git-commit') %>.png"
      destCSS: "assets/sass/partial/_sprite-#{target}.sass"
      # destCSS: "assets/scss/partial/_sprite-#{target}.scss"
      # destCSS: "assets/less/partial/_sprite-#{target}.less"
      # destCSS: "assets/styl/partial/_sprite-#{target}.styl"
      cssTemplate: 'assets/sass/template.mustache'
      # cssTemplate: 'assets/scss/template.mustache'
      # cssTemplate: 'assets/less/template.mustache'
      # cssTemplate: 'assets/styl/template.mustache'
      cssOpts:
        target: target
      engineOpts:
        imagemagick: !!process.env.TRAVIS

  grunt.config 'sprite', config
  grunt.loadNpmTasks 'grunt-spritesmith'