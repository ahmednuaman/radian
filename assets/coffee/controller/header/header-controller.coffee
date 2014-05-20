define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
  # Jump to [`controller/header/header-menu-controller.coffee`](header-menu-controller.html) ☛
  'controller/header/header-menu-controller'
], (cfg, RC) ->
  RC 'HeaderController', [
    '$scope'
  ],
  init: () ->
    @addPartials()

  addPartials: () ->
    @$scope.menuPartial = "#{cfg.path.partial}header/header-menu-partial.html"