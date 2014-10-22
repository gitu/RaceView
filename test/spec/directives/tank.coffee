'use strict'

describe 'Directive: tank', ->

  # load the directive's module
  beforeEach module 'raceViewApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
