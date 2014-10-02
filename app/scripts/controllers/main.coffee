'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
