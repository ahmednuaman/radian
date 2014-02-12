# This is a simple recursive crawler that users [PhatomJS](http://phantomjs.org) to create snap shots of your site
# and save them as static, SEO friendly HTML files.
#
# The crawler works on the basis that your app's URLs are
# [RESTful](https://www.google.co.uk/search?q=restful+api+design) and compensates for this design by saving the
# generated document's HTML in an `index.html` file. This means that if your URL is `/foo/bar`, it can then be accessed
# via `/foo/bar/` and `/foo/bar/index.html` in addition to the original schema,
fs = require 'fs'
page = (require 'webpage').create()
system = require 'system'

# This crawler can be used directly with PhatomJS in the terminal by running
# `phantomjs crawler.coffee http://your-server/ output-folder/ page-timeout ignore-regex`.
base = system.args[2]
home = system.args[1]
ignoreRegex = system.args[4]
pageTimeout = system.args[3] || 8000

if ignoreRegex
  ignoreRegex = new RegExp system.args[4]

# This `indexed` array stores all the URLs that have already been indexed.
indexed = []

# And this `queue` array stores the URLs waiting to be indexed.
queue = []

# This function returns the HTML document of the indexed page.
getHTML = () ->
  # Since radian uses [RequireJS](http://requirejs.org/), this strips the `<script>` tags from the `<head>` of the
  # document and also removes the `<style>` tag placed there to deal with any
  # [`ngCloak`](http://docs.angularjs.org/api/ng.directive:ngCloak) CSS. This is done because the site _should_ work
  # if there is no javascript enabled.
  tags = document.querySelectorAll 'head script, head style, #mask'
  len = tags.length

  while len--
    tag = tags[len]
    tag.parentNode.removeChild tag

  return document.documentElement.outerHTML

# This function searches for links in the current document.
findLinks = () ->
  as = document.querySelectorAll 'a[href]'
  len = as.length
  links = []

  while len--
    links.push as[len].href

  return links

# This function takes the generated HTML and saves it as a static file named as the address of the indexed document.
save = (address, html) ->
  # Strip out the base URL of the site; the homepage per sa.
  name = address.replace home, ''

  if name
    # Creates a file path tree according to the named address of the document.
    fs.makeTree base + name

    # Checks for and adds a trailing slash if there isn't one there.
    if (name.charAt name.length - 1) isnt '/'
      name += '/'

  # Appends an `index.html` to path and this means that the URL has a truly RESTful schema.
  path = base + name + 'index.html'

  console.log "Indexed #{address} and saved to #{path}"

  fs.write path, html, 'w'

# This function brings together the three previous functions and handles which URLs are to be indexed.
index = (address) ->
  html = page.evaluate getHTML
  links = page.evaluate findLinks
  len = links.length

  console.log "Beginning indexing of #{address}"

  while len--
    href = links[len]

    # Checks that the `link` starts with the `home` URL, so that it only indexes local pages and not the internet.
    if (href.indexOf home) isnt 0
      continue

    # Checks to see that the `link` hasn't already been indexed and isn't already in the queue.
    if (indexed.indexOf href) isnt -1 or (queue.indexOf href) isnt -1
      continue

    # Checks to see that the `link` doesn't match the `ignoreRegex`, if any.
    if ignoreRegex
      if href.match ignoreRegex
        continue

    # Adds the `link` to the `queue`
    console.log "Adding #{href} to the queue"

    queue.push href

  save address, html

  # Checks to see if there's an outstanding queue and grabs the next one.
  if queue.length
    next queue.pop()

  else
    phantom.exit()

# This function use's Angular's `$browser.notifyWhenNoOutstandingRequests()` to wait for the app to settle and then
# writes a message to the `console.log` notifying Phantom that it's ready to be indexed.
waitForAppLoaded = (consoleLogVar) ->
  w = window

  w.waitForAngular = () ->
    if document.documentElement.classList.contains 'ng-scope'
      w.clearInterval w.interval

      w.angular.element(document.documentElement).injector().get('$browser').notifyWhenNoOutstandingRequests () ->
        w.console.log consoleLogVar

  document.addEventListener 'DOMContentLoaded', () ->
    w.interval = w.setInterval w.waitForAngular, 0

# This function loads the next address and prepares to index it. There's a default timeout of 3 seconds but you can
# change that either in the source code or via the `cli`.
next = (address) ->
  timeout = null
  console.log "Opening #{address}"

  # Generate a unique `consoleLogVar` to notify Phantom that this page has loaded.
  consoleLogVar = btoa address

  # We listen to a specific `console.log` fired by our script when Angular's
  # `$browser.notifyWhenNoOutstandingRequests()` is fired.
  page.onConsoleMessage = (message) ->
    # Check that the message is the same as our `consoleLogVar`.
    if message is consoleLogVar
      # So it looks like the page has loaded, cancel the `timeout` and index it
      clearTimeout timeout
      index address

  page.onInitialized = () ->
    # Add a listener to the page to notify us when Angular has settled.
    page.evaluate waitForAppLoaded, consoleLogVar

    indexed.push address

    timeout = setTimeout index, pageTimeout, address

  # Now we open the page in Phantom.
  page.open address

# Finally we start everything off by indexing the homepage.
next home
