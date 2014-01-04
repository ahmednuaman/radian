# This is a base filter class to ease the creation filter process. To see an example of how to use this have a look at
# [`filter/stub-filter.coffee`](stub-filter.html).
define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  RadianFilter = (name, deps, filter) ->
    helper.register filter, helper.type.filter, name, deps