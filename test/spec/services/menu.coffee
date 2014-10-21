'use strict'

describe 'Service: menu', ->

  # load the service's module
  beforeEach module 'raceViewApp'

  # instantiate service
  menu = {}
  beforeEach inject (_menu_) ->
    menu = _menu_
