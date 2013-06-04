require 'js-yaml'
http = require 'http'

config = require '../config/backend.yml'

module.exports = (req, cb) ->
  console.log "-------- request backend"
  breq = http.request
    hostname: config.host
    port: config.port
    method: req.method.toLowerCase()
    path: req.url
    headers: req.headers

  breq.on 'error', (err) =>
    cb 502

  breq.on 'response', (bres) =>
    buffer = ''

    bres.on 'data', (chunk) =>
      buffer += chunk

    bres.on 'end', =>
      cb null, buffer, bres.headers

  req.on 'data', (chunk) =>
    breq.write chunk, 'binary'

  req.on 'end', =>
    breq.end()
