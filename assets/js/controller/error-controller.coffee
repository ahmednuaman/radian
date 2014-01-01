define [
  # Jump to [`controller/radian-controller.coffee`](radian-controller.html) ☛
  'controller/radian-controller'
], (RC) ->
  class ErrorController extends RC
    @register 'ErrorController', [
      '$scope'
      '$routeParams'
    ]

    init: () ->
      @$scope.code = @$routeParams.code || '404'