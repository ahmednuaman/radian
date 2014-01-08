module.exports = (grunt) ->
  grunt.registerTask 'githash', 'grabs the latest git commit hash', () ->
    done = @async()

    config =
      cmd: 'git'
      args: [
        'rev-parse'
        '--verify'
        'HEAD'
      ]

    grunt.util.spawn config, (err, result) ->
      # To deal with cache busting this task grabs the latest git commit sha1 and uses this for naming the optimised
      # CSS and JS files.
      grunt.config 'git-commit', result.stdout

      grunt.task.run tasks

      done()