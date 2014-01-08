module.exports = (grunt) ->
  grunt.config 'sprite',
    icon:
      src: [
        'assets/img/icon/*.png'
      ]
      destImg: 'assets/img/icon-<%= grunt.config("git-commit") %>.png'
      imgPath: '../img/icon-<%= grunt.config("git-commit") %>.png'
      destCSS: 'assets/css/partial/_sprite-icon.sass'
      # destCSS: 'assets/css/partial/_sprite-icon.scss'
      # destCSS: 'assets/css/partial/_sprite-icon.less'
      # destCSS: 'assets/css/partial/_sprite-icon.styl'
      cssTemplate: 'assets/css/template/sass.mustache'
      # cssTemplate: 'assets/css/template/scss.mustache'
      # cssTemplate: 'assets/css/template/less.mustache'
      # cssTemplate: 'assets/css/template/styl.mustache'

  grunt.loadNpmTasks 'grunt-spritesmith'