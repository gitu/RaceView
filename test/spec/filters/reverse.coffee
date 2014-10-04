'use strict'

describe 'Filter: reverse', ->

  # load the filter's module
  beforeEach module 'raceViewApp'

  # initialize a new instance of the filter before each test
  reverse = {}
  beforeEach inject ($filter) ->
    reverse = $filter 'reverse'

  it 'should return the input prefixed with "reverse filter:"', ->
    text = ['A','B']
    expect(reverse text).toEqual(['B','A'])
