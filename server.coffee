# This is a helper file that is used to launch a local server used for development of your app.
express = require 'express'
fs = require 'fs'
app = express()
# By default the server launches at `http://localhost:8000`, you can change it in the
# [`grunt/express-server.coffee`](express-server.html) file config.
port = process.env.PORT || 8000

app.configure () ->
  # The server is also configured to allow CORS.
  app.use (request, response, next) ->
    response.header 'Access-Control-Allow-Origin', '*'
    response.header 'Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS'
    response.header 'Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With'

    next()

  # This is for debugging purposes, it allows you to view the raw files as plain text.
  app.use (request, response, next) ->
    if /\.(coffee|jade|sass|scss|styl|less)$/.test request.url
      response.set 'Content-Type', 'text/plain'

    next()

  # The server will server everything in the root folder it's launched from. If you want to test the built files
  # then you can do a quick and sneaky change here to point it to the `/build` directory instead.
  app.use '/', express.static "#{__dirname}/"

app.options '*', (request, response, next) ->
  response.send 200

app.all '*', (request, response, next) ->
  response.sendfile "#{__dirname}/index.html"

app.listen port, () ->
  console.log "Listening on port: #{port}"