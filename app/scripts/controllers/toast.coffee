'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:ToastctrlCtrl
 # @description
 # # ToastctrlCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'ToastCtrl', ($scope) ->
  $scope.closeToast = ->
    $hideToast()
