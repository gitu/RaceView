'use strict'

describe 'Controller: ParticipantsCtrl', ->

  # load the controller's module
  beforeEach module 'raceViewApp'

  ParticipantsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ParticipantsCtrl = $controller 'ParticipantsCtrl', {
      $scope: scope
    }

