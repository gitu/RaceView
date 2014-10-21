'use strict'

describe 'Filter: humanizeDoc', ->

  # load the filter's module
  beforeEach module 'raceViewApp'

  # initialize a new instance of the filter before each test
  humanizeDoc = {}
  beforeEach inject ($filter) ->
    humanizeDoc = $filter 'humanizeDoc'

