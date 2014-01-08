module.exports = (grunt) ->
  grunt.config 'sprite',
    icon:
      src: [
        'assets/img/icon/*.png'
      ]
      destImg: 'assets/img/icon-<%= grunt.config("git-commit") %>.png'
      imgPath: '../img/icon-<%= grunt.config("git-commit") %>.png'
      destCSS: 'assets/sass/partial/_sprite-icon.sass'
      # destCSS: 'assets/scss/partial/_sprite-icon.scss'
      # destCSS: 'assets/less/partial/_sprite-icon.less'
      # destCSS: 'assets/styl/partial/_sprite-icon.styl'
      cssTemplate: 'assets/sass/template.mustache'
      # cssTemplate: 'assets/scss/template.mustache'
      # cssTemplate: 'assets/less/template.mustache'
      # cssTemplate: 'assets/styl/template.mustache'

  grunt.loadNpmTasks 'grunt-spritesmith'