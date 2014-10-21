'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:LeftctrlCtrl
 # @description
 # # LeftctrlCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'LeftCtrl', ($scope, $timeout, $mdSidenav) ->
  nav = undefined
  $timeout ->
    nav = $mdSidenav("left")

  $scope.close = ->
    nav.close()

