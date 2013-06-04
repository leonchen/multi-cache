module.exports = (err, req, res, next) ->
  res.statusCode = err
  res.end()
