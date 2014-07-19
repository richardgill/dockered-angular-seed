assert = require 'assert'

stepDefinitions = () ->
  this.World = require('../support/world').World
  this.Given /^I am on the home page$/, (callback) ->
    #express the regexp above with the code you wish you had
    this.visit('', callback)

  this.Then /^I should see "([^"]*)" in "([^"]*)"$/, (text, selector, callback) ->
    #express the regexp above with the code you wish you had
    assert.equal text, this.browser.text(selector)
    callback()

module.exports = stepDefinitions
