'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:ParticipantsCtrl
 # @description
 # # ParticipantsCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'ParticipantsCtrl', ($scope, $mdDialog) ->
  $scope.hasCar = (request) ->
    angular.forEach $scope.cars, (car) ->
      if car.currentOwner == request.uid
        return true
    return false

  $scope.getCar = (request) ->
    angular.forEach $scope.cars, (car) ->
      if car.currentOwner == request.uid
        return car
    return null

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
      console.log(answer + "-" + request);
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



