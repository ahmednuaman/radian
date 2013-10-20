fs = require 'fs'
page = (require 'webpage').create()
system = require 'system'

base = system.args[2]
home = system.args[1]
indexed = []
queue = []

getHTML = () ->
  tags = document.querySelectorAll 'head script, head style'
  len = tags.length

  while len--
    tag = tags[len]
    tag.parentNode.removeChild tag

  return document.documentElement.outerHTML

findLinks = () ->
  as = document.querySelectorAll 'a[href]'
  len = as.length
  links = []

  while len--
    links.push as[len].href

  return links

index = (address) ->
  html = page.evaluate getHTML
  links = page.evaluate findLinks
  len = links.length

  while len--
    href = links[len]

    if (href.indexOf home) isnt 0
      continue

    if (indexed.indexOf href) is -1 and (queue.indexOf href) is -1
      queue.push href

  save address, html

  if queue.length
    next queue.pop()

  else
    phantom.exit()

next = (address) ->
  page.open address, (status) ->
    indexed.push address

    setTimeout index, 3000, address

save = (address, html) ->
  name = address.replace home, ''

  if name
    fs.makeTree name

    if (name.charAt name.length - 1) isnt '/'
      name += '/'

  path = base + name + 'index.html'

  console.log "Indexed #{address} and saved to #{path}"

  fs.write path, html, 'w'

next home