var express = require('express');
var fs = require('fs');

var app = express();
var port = 8000;

app.configure(function() {
  app.use(function(request, response, next) {
    response.header('Access-Control-Allow-Origin', '*');
    response.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    response.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');

    next();
  });

  app.use('/', express.static(__dirname + '/'));
});

app.use(express.bodyParser());
app.use(express.logger());

app.options('*', function(request, response, next) {
  response.send(200);
});

app.get('*', function(request, response, next) {
  response.sendfile(__dirname + '/index.html');
});

app.listen(port, function() {
  console.log('Listening on port: ' + port);
});