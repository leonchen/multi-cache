require 'js-yaml'
config = require '../config/cache.yml'

class Cache
  constructor: ->
    @cache = {}

  get: (key, cb) ->
    data = @cache[key]
    if data
      cb null, data.body, data.headers
    else
      cb 404

  set: (key, body, headers, cb) ->
    @cache[key] =
      body: body
      headers: headers
    cb()


module.exports = new Cache
