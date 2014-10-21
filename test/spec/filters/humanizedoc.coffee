'use strict'

describe 'Filter: humanizeDoc', ->

  # load the filter's module
  beforeEach module 'raceViewApp'

  # initialize a new instance of the filter before each test
  humanizeDoc = {}
  beforeEach inject ($filter) ->
    humanizeDoc = $filter 'humanizeDoc'

  it 'should return the input prefixed with "humanizeDoc filter:"', ->
    text = 'angularjs'
    expect(humanizeDoc text).toBe ('humanizeDoc filter: ' + text)
