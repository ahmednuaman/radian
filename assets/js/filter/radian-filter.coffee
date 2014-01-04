# This is a base filter class to ease the creation filter process. To see an example of how to use this have a look at
# [`filter/stub-filter.coffee`](stub-filter.html). The useage is pretty simple:
# ```
# RC 'filterName', ['deps', 'as', 'array'], filterFunc
# ```
define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  RadianFilter = () ->
    helper.registerFilter arguments