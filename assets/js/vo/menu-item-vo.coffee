# This is a simple example of a VO. In this case the raw data recieved from the API will an array of objects like this:
#
# ```
# {
#   "title": "Getting started",
#   "href": "/"
# }
# ```
#
# We need to know when this menu item is selected (eg by the user visiting its page) so that we can apply a visual
# distinction, such as a CSS class; therefore the raw data is mapped to this VO which opens up extra properties.
define [
  'lodash'
], (_) ->
  (data) ->
    _.assign data,
      selected: false
      target: data['target']