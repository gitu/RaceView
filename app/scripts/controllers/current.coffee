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
  $scope.lastQualifying = {};
  $scope.race = {};
  $scope.qualifying = {};

  $scope.trackState = fbutil.syncObject(['trackState']);

  fbutil.syncObject('lastRace').$bindTo($scope, 'lastRace');
  fbutil.syncObject('lastQualifying').$bindTo($scope, 'lastQualifying');


  $scope.$watch 'lastQualifying', (value) ->
    if value != undefined
      if value.$value != undefined
        $scope.qualifying = fbutil.syncObject(['races',value.$value]);

  $scope.$watch 'lastRace', (value) ->
    if value != undefined
      if value.$value != undefined
        $scope.race = fbutil.syncObject(['races',value.$value]);






