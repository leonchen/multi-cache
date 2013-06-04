express = require 'express'

app = express()

app.use app.router
require('./route')(app)

app.use require('./middleware/handler')

module.exports = app
