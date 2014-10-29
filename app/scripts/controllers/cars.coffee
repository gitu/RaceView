'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:CarsCtrl
 # @description
 # # CarsCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'CarsCtrl', ($scope) ->
  $scope.images = ['porsche', 'ferrari', 'mercedes', 'audi']

  $scope.setCar = (car) ->
    $scope.cars[car.id] = car;
    $scope.cars.$save()

  $scope.deleteCar = (id) ->
    delete $scope.cars[id];
    $scope.cars.$save()

