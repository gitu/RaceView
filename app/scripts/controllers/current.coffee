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

  $scope.lastRace = {};
  $scope.race = {};

  fbutil.syncObject('lastRace').$bindTo($scope, 'lastRace');

  $scope.$watch 'lastRace', (value) ->
    if value != undefined
      if value.$value != undefined
        $scope.race = fbutil.syncObject(['race',value.$value]);






