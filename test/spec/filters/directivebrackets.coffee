'use strict'

describe 'Filter: directiveBrackets', ->

  # load the filter's module
  beforeEach module 'raceViewApp'

  # initialize a new instance of the filter before each test
  directiveBrackets = {}
  beforeEach inject ($filter) ->
    directiveBrackets = $filter 'directiveBrackets'

