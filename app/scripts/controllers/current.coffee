'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:CurrentCtrl
 # @description
 # # CurrentCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
  .controller 'CurrentCtrl', ($scope,fbutil) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.lastRace = '##';
    Console.log('hello');

    fbutil.syncData('lastRace').$bind($scope, 'lastRace');


