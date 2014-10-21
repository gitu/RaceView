'use strict'

describe 'Controller: ToastctrlCtrl', ->

  # load the controller's module
  beforeEach module 'raceViewApp'

  ToastctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ToastctrlCtrl = $controller 'ToastctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
