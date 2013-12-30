# This config file acts as a safe and logical place to house variables that will be used throughout the app.
# The most prominent variable here is `ngApp`; this is used to store the app's [AngularJS](http://angularjs.org) module
# name and all of the app's AngularJS module files will use this variable to add themselves to the module.
define [], () ->
  ngApp: 'radian'
  api:
    data: '/data/menu.json'
  path:
    partial: '/assets/partial/'