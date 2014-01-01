define [
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
], (RC) ->
  class extends RC
    @register 'ErrorController', [
      '$scope'
      '$routeParams'
      'pageTitleFactory'
    ]

    init: () ->
      @$scope.code = @$routeParams.code || '404'

      @pageTitleFactory.setTitle "Error #{@$scope.code}"