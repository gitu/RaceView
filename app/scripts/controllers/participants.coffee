'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:ParticipantsCtrl
 # @description
 # # ParticipantsCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'ParticipantsCtrl', ($scope, $mdDialog, $filter) ->
  $scope.hasCar = (request) ->
    return $scope.getCar(request)?

  $scope.getCar = (request) ->
    cars = []
    angular.forEach $scope.cars, (car, key) ->
      if car.currentOwner? and request.uid?
        if car.currentOwner == request.uid
          this.push car
    , cars
    return cars[0]

  $scope.removeRequest = (request) ->
    if not $scope.hasCar(request.car)
      $scope.raceRequests.$remove(request)

  $scope.showAssignCarDialog = (ev, request) ->
    $mdDialog.show(
      templateUrl: "views/participants.assign.html"
      targetEvent: ev
      controller: AssignRequestCtrl
      locals: {cars: $scope.cars, hasCar: $scope.hasCar(request)}
    ).then ((answer)->
      if $scope.hasCar(request)
        console.log $scope.getCar(request)
        delete $scope.getCar(request).currentOwner
      if answer? && answer > 0
        $scope.cars[answer].currentOwner = request.uid
      $scope.cars.$save()
      return
    ), ->
      return
    return

  AssignRequestCtrl = ($scope, $mdDialog, cars, hasCar) ->
    $scope.cars = cars
    $scope.hasCar = hasCar
    $scope.hide = ->
      $mdDialog.hide()
      return
    $scope.answer = (answer) ->
      $mdDialog.hide answer
      return



