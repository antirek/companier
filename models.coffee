mongoose = require 'mongoose'
Schema = mongoose.Schema
db = mongoose.createConnection 'mongodb://localhost/companier'
category =
  name:
    type: String
    required: true
company =
  name:
    type: String
    require: true
  inn:
    type: String
    require: true
  site:
    type: String
    require: true
  email:
    type: String
    require: true
  filials: [
    address:
      type: String
      required: true
    phone:
      type: String
      required: true
  ]
  category: [String]


module.exports =
  Company: db.model 'company', new Schema company
  Category: db.model 'category', new Schema category