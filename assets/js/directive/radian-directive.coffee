# This is a base directive class to ease the creation directive process. To see an example of how to use this have a
# look at [`directive/stub-directive.coffee`](stub-directive.html).
define [
  # Jump to [`helper/radian-module-helper.coffee`](radian-module-helper.html) ☛
  'helper/radian-module-helper'
], (helper) ->
  RadianDirective = (name, deps, directive) ->
    helper.register directive, helper.type.directive, name, deps