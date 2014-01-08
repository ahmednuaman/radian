# This is a dummy file used for local debugging. It is replaced by `grunt-angular-templates` during the build process.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
], (cfg, A) ->
  partials = ($templateCache) ->
    # This is on purpose as `grunt-angular-templates` will replace this with the compiled partials.
    '#{script}'

  partials.$inject = [
    '$templateCache'
  ]

  app = A.module cfg.ngApp
  app.run partials