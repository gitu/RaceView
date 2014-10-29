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

  parseRoundsForCar = (rounds, car) ->
    roundData = {
      rounds: []
      fastest: {}
    }
    angular.forEach rounds, (round, index) ->
      if (!!round.cars[car])
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

  getPositions = () ->
    sortedCars = []
    angular.forEach $scope.cars, (car) ->
      car.race.totalRounds = car.race.rounds.length
      totalTime = 0
      angular.forEach car.race.rounds, (round) ->
        totalTime += round.time
      car.race.totalTime = totalTime
      sortedCars.push car
    sortedCars.sort (a, b) ->
      if (a.race.totalRounds > b.race.totalRounds)
        return -1
      if (a.race.totalRounds < b.race.totalRounds)
        return 1
      if (a.race.totalTime < b.race.totalTime)
        return -1
      if (a.race.totalTime > b.race.totalTime)
        return 1
      return 1
    firstCar = sortedCars[0]
    angular.forEach sortedCars, (car, index) ->
      car.race.rank = index + 1
      car.race.roundDiff = firstCar.race.totalRounds - car.race.totalRounds
      totalCar = 0
      totalLastCar = 0
      if (car.race.totalRounds > 0)
        for i in [0..(car.race.totalRounds - 1)] by 1
          totalCar += car.race.rounds[i].time
          totalLastCar += firstCar.race.rounds[i].time
      car.race.timeDiff = totalLastCar - totalCar

  $scope.$watch 'race.cars', (value) ->
    if value != undefined
      $timeout (->
        parseRace($scope.race, 'race')
        getPositions()
      ), 10


  $scope.$watch 'qualifying.cars', (value) ->
    if value != undefined
      $timeout (->
        parseRace($scope.qualifying, 'qualifying')
      ), 10




