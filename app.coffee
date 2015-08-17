express = require 'express'
mongooseRouter = require 'mongoose-router'

app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'jade'

app.get '/', (req, res)->
  res.render 'index'

app.use '/bower_components', express.static "#{__dirname}/bower_components"
app.use '/public', express.static "#{__dirname}/public"
app.use '/uploads', express.static "#{__dirname}/uploads"

app.get '/partials/:folder/:view', (req, res)->
  res.render "partials/#{req.params.folder}/#{req.params.view}"

models = require './models'
app.use '/company', mongooseRouter models.Company
app.use '/category', mongooseRouter models.Category
app.use '/catalog', mongooseRouter models.Catalog
app.use '/item', mongooseRouter models.Item
app.use '/', require './images'


app.listen 3000