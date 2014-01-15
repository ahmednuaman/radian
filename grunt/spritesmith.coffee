module.exports = (grunt) ->
  config = {}
  language = 'sass'
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
      destCSS: "assets/#{language}/partial/_sprite-#{target}.#{language}"
      cssTemplate: "assets/#{language}/template.mustache"
      cssOpts:
        target: target
      engineOpts:
        imagemagick: !!process.env.TRAVIS

  grunt.config 'sprite', config
  grunt.loadNpmTasks 'grunt-spritesmith'