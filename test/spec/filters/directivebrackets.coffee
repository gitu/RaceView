'use strict'

describe 'Filter: directiveBrackets', ->

  # load the filter's module
  beforeEach module 'raceViewApp'

  # initialize a new instance of the filter before each test
  directiveBrackets = {}
  beforeEach inject ($filter) ->
    directiveBrackets = $filter 'directiveBrackets'

  it 'should return the input prefixed with "directiveBrackets filter:"', ->
    text = 'angularjs'
    expect(directiveBrackets text).toBe ('directiveBrackets filter: ' + text)
