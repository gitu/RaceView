'use strict'

describe 'Controller: LeftctrlCtrl', ->

  # load the controller's module
  beforeEach module 'raceViewApp'

  LeftctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LeftctrlCtrl = $controller 'LeftctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
