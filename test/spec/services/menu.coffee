'use strict'

describe 'Service: menu', ->

  # load the service's module
  beforeEach module 'raceViewApp'

  # instantiate service
  menu = {}
  beforeEach inject (_menu_) ->
    menu = _menu_

  it 'should do something', ->
    expect(!!menu).toBe true
