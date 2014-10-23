'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:CurrentCtrl
 # @description
 # # CurrentCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp').controller 'CurrentCtrl', ($scope, $timeout, fbutil) ->
  alert = (msg) ->
    console.log(msg);
    $scope.err = msg
    $timeout (->
      $scope.err = null
    ), 5000

  $scope.cars = {};
  $scope.lastRace = {};
  $scope.lastQualifying = {};
  $scope.race = {};
  $scope.qualifying = {};

  $scope.trackState = fbutil.syncObject(['trackState']);

  fbutil.syncObject('lastRace').$bindTo($scope, 'lastRace');
  fbutil.syncObject('lastQualifying').$bindTo($scope, 'lastQualifying');


  $scope.$watch 'lastQualifying', (value) ->
    if value != undefined && value.$value != undefined
      $scope.qualifying = fbutil.syncObject(['races', value.$value]);

  $scope.$watch 'lastRace', (value) ->
    if value != undefined && value.$value != undefined
      $scope.race = fbutil.syncObject(['races', value.$value]);

  parseRoundsForCar = (rounds, car) ->
    roundData = {
      rounds: []
      fastest: {}
    }
    angular.forEach rounds, (round, index) ->
      roundData.rounds[index] = {
        round: index + 1
        time: round.cars[car]
        fastest: false
      }
      if roundData.fastest.time == undefined || roundData.fastest.time > round.cars[car]
        roundData.fastest.time = round.cars[car]
        roundData.fastest.index = index
    if roundData.fastest.time != undefined
      roundData.rounds[roundData.fastest.index].fastest = true
    return roundData


  parseRace = (race, type) ->
    angular.forEach race.cars, (car, index) ->
      if car.raw != undefined
        if $scope.cars[index] == undefined
          $scope.cars[index] = {title: 'Car ' + index, nr: index}
        carData = $scope.cars[index]
        carData[type] = parseRoundsForCar(race[type].rounds, index)


  $scope.$watch 'race.cars', (value) ->
    if value != undefined
      $timeout (->
        parseRace($scope.race, 'race')
      ), 10


  $scope.$watch 'qualifying.cars', (value) ->
    if value != undefined
      $timeout (->
        parseRace($scope.qualifying, 'qualifying')
      ), 10




