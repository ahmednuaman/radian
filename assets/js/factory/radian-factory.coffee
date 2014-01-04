# This is a base factory class to ease the creation factory process. To see an example of how to use this have a look at
# [`factory/stub-factory.coffee`](stub-factory.html). The useage is pretty simple:
# ```
# RC 'factoryName', ['deps', 'as', 'array'], factoryFunc
# ```
define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  RadianFactory = () ->
    helper.registerFactory arguments