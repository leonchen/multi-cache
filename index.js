require('coffee-script');
require('coffee-trace');
require('js-yaml');
var config = require('./config/server.yml');
var app = require('./server');
app.listen(config.port);
