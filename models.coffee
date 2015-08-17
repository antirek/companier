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
    required: true
  inn:
    type: String
    required: true
  site:
    type: String
    required: true
  email:
    type: String
    required: true
  description:
    type: String
    required: true
  filials: [
    address:
      type: String
      required: true
    phone:
      type: String
      required: true
  ]
  category: [String]
catalog =
  name:
    type: String
    required: true
  company_id:
    type: String
    required: true
  items: [

  ]
  groups: [
    name: String
    id: String
  ]
item =
  catalog_id: String
  group_id: String
  name: String
  description: String
  images: [
    hash: String
    name: String
  ]
module.exports =
  Company: db.model 'company', new Schema company
  Category: db.model 'category', new Schema category
  Catalog: db.model 'catalog', new Schema catalog
  Item: db.model 'item', new Schema item