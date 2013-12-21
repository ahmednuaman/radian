# This is a simple example of a VO. In this case the raw data recieved from the API will an array of objects like this:
#
#    {
#      "title": "Getting started",
#      "href": "/"
#    }
define [], () ->
  (data) ->
    vo =
      selected: false
      href: data.href
      title: data.title