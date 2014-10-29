'use strict'

describe 'Controller: CarsCtrl', ->

  # load the controller's module
  beforeEach module 'raceViewApp'

  CarsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CarsCtrl = $controller 'CarsCtrl', {
      $scope: scope
    }

