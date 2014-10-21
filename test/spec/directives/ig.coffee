'use strict'

describe 'Directive: ig', ->

  # load the directive's module
  beforeEach module 'raceViewApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
