'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:CurrentCtrl
 # @description
 # # CurrentCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp').controller 'CurrentCtrl', ($scope, $timeout, FBURL, $firebase) ->
  alert = (msg) ->
    $scope.err = msg
    $timeout (->
      $scope.err = null
    ), 5000

  ref = new Firebase(FBURL).child('lastRace');
  $scope.lastRace = $firebase(ref).$asObject();
  console.log($scope.lastRace);





