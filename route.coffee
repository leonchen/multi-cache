require 'js-yaml'

routes = require './config/routes.yml'

module.exports = (app) ->
  for method, paths of routes
    if paths?
      paths.forEach (path) =>
        app[method] path, (req, res, next) =>
          req.caching = true
          next()
