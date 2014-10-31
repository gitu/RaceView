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
    angular.forEach $scope.qualifying.cars, (car, key) ->
      if car.currentOwner? and request.uid?
        if car.currentOwner == request.uid
          this.push car
    , cars
    return cars[0]

  $scope.hasCarRace = (request) ->
    return $scope.getCarRace(request)?

  $scope.getCarRace = (request) ->
    cars = []
    angular.forEach $scope.race.cars, (car, key) ->
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
      controller: 'AssignRequestCtrl'
      locals: {cars: $scope.cars, hasCar: $scope.hasCar(request), qualifying: $scope.qualifying}
    ).then ((answer)->
      if $scope.hasCar(request)
        console.log $scope.getCar(request)
        delete $scope.getCar(request).currentOwner
      if answer? && answer > 0
        console.log('setting car: ' + answer)
        if !!!$scope.qualifying.cars[answer]
          $scope.qualifying.cars[answer] = {id: answer}
        console.log($scope.qualifying.cars[answer])
        $scope.qualifying.cars[answer].id = answer
        $scope.qualifying.cars[answer].currentOwner = request.uid
        $scope.qualifying.cars[answer].image = $scope.cars[answer].image
        $scope.qualifying.cars[answer].text = $scope.cars[answer].text
        $scope.qualifying.$save()
        console.log($scope.qualifying.cars[answer])
      return
    ), ->
      return
    return

  $scope.showAssignCarDialogRace = (ev, request) ->
    $mdDialog.show(
      templateUrl: "views/participants.assign.html"
      targetEvent: ev
      controller: 'AssignRequestCtrl'
      locals: {cars: $scope.cars, hasCar: $scope.hasCar(request), qualifying: $scope.race}
    ).then ((answer)->
      if $scope.hasCarRace(request)
        console.log $scope.getCarRace(request)
        delete $scope.getCarRace(request).currentOwner
      if answer? && answer > 0
        console.log('setting car: ' + answer)
        if !!!$scope.race.cars[answer]
          $scope.race.cars[answer] = {id: answer}
        console.log($scope.race.cars[answer])
        $scope.race.cars[answer].id = answer
        $scope.race.cars[answer].currentOwner = request.uid
        $scope.race.cars[answer].image = $scope.cars[answer].image
        $scope.race.cars[answer].text = $scope.cars[answer].text
        $scope.race.$save()
        console.log($scope.race.cars[answer])
      return
    ), ->
      return
    return

angular.module('raceViewApp')
.controller 'AssignRequestCtrl', ($scope, $mdDialog, cars, hasCar, qualifying) ->
    $scope.cars = cars
    $scope.hasCar = hasCar
    $scope.qualifying = qualifying
    $scope.hide = ->
      $mdDialog.hide()
      return
    $scope.answer = (answer) ->
      $mdDialog.hide answer
      return



