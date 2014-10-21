'use strict'

describe 'Directive: ig', ->

  # load the directive's module
  beforeEach module 'raceViewApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ig></ig>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ig directive'
