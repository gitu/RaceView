'use strict'

describe 'Controller: CurrentCtrl', ->

  # load the controller's module
  beforeEach module 'raceViewApp'

  CurrentCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CurrentCtrl = $controller 'CurrentCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
