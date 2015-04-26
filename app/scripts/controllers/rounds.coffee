'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:CurrentCtrl
 # @description
 # # CurrentCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp').controller 'RoundsCtrl', ($scope, $timeout, fbutil) ->
  alert = (msg) ->
    console.log(msg);
    $scope.err = msg
    $timeout (->
      $scope.err = null
    ), 5000

  $scope.rounds = fbutil.syncArray('rounds')





