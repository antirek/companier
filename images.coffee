express = require 'express'
multipart = require 'connect-multiparty'
gm = require 'gm'

router = express.Router()
router.use multipart()
router.post '/saveImage/:id', (req, res)->
  id = req.params.id
  if id and req.files
    gm req.files.file.path
    .write "#{__dirname}/uploads/#{id}.png", (err)->
      if err
        console.log err
      else
        console.log "image saved"
  res.sendStatus 200

module.exports = router