zombie = require 'zombie'

World = (callback) ->
  #this.browser will be available in step definitions
  this.browser = new zombie.Browser
    site : 'http://localhost:8000/app/index.html#/'

  this.visit = (uri, callback) ->
    this.browser.visit(uri, callback)

  #tell Cucumber we're finished and to use 'this' as the world instance
  callback(this)

exports.World = World

