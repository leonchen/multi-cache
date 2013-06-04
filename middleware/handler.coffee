cache = require '../lib/cache'
backend = require '../lib/backend'

module.exports = (req, res, next) ->
  cb = (e, body, headers) =>
    return next e if e
    res.set headers
    res.end body
    next()

  if req.caching
    cache.get req.url, (er, cBody, cHeaders) =>
      if er
        backend req, (err, body, headers) =>
          return cb err if err
          cache.set req.url, body, headers, =>
            cb null, body, headers
      else
        cb null, cBody, cHeaders
  else
    backend req, (er, body, headers) =>
      return cb er if er
      cb null, body, headers
