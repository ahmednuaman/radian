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
# `phantomjs crawler.coffee http://your-server/ output-folder/ page-timeout`.
base = system.args[2]
home = system.args[1]
timeout = system.args[3] || 3000

# This `indexed` array stores all the URLs that have already been indexed.
indexed = []

# And this `queue` array stores the URLs waiting to be indexed.
queue = []

# This function returns the HTML document of the indexed page.
getHTML = () ->
  # Since radian uses [RequireJS](http://requirejs.org/), this strips the `<script>` tags from the `<head>` of the
  # document and also removes the `<style>` tag placed there to deal with any
  # [`ngCloak`](http://docs.angularjs.org/api/ng.directive:ngCloak) CSS.
  tags = document.querySelectorAll 'head script, head style'
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
    fs.makeTree name

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

  while len--
    href = links[len]

    # Checks that the `link` starts with the `home` URL, so that it only indexes local pages and not the internet.
    if (href.indexOf home) isnt 0
      continue

    # Checks to see that the `link` hasn't already been indexed and isn't already in the queue.
    if (indexed.indexOf href) is -1 and (queue.indexOf href) is -1
      queue.push href

  save address, html

  # Checks to see if there's an outstanding queue and grabs the next one.
  if queue.length
    next queue.pop()

  else
    phantom.exit()

# This function loads the next address and prepares to index it. There's a default timeout of 3 seconds but you can
# change that either in the source code or via the `cli`.
next = (address) ->
  page.open address, (status) ->
    indexed.push address

    setTimeout index, timeout, address

# Finally we start everything off by indexing the homepage.
next home