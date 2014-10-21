'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the raceViewApp
###
angular.module('raceViewApp')
.controller 'MainCtrl', ($scope, $mdToast, $mdDialog) ->
  $scope.toastIt = ->
    $mdToast
      template: "<md-toast>Hello!</md-toast>"
      duration: 3000

  $scope.dialog = (e) ->
    $mdDialog
      templateUrl: "views/dialog.html"
      targetEvent: e
      controller: [
        "$scope"
        "$hideDialog"
        ($scope, $hideDialog) ->
          $scope.close = ->
            $hideDialog()
      ]

  $scope.todos = [
    {
      face: "/img/list/60.jpeg"
      what: "Brunch this weekend?"
      who: "Min Li Chan"
      when: "3:08PM"
      notes: " I'll be in your neighborhood doing errands"
    }
    {
      face: "/img/list/60.jpeg"
      what: "Brunch this weekend?"
      who: "Min Li Chan"
      when: "3:08PM"
      notes: " I'll be in your neighborhood doing errands"
    }
    {
      face: "/img/list/60.jpeg"
      what: "Brunch this weekend?"
      who: "Min Li Chan"
      when: "3:08PM"
      notes: " I'll be in your neighborhood doing errands"
    }
    {
      face: "/img/list/60.jpeg"
      what: "Brunch this weekend?"
      who: "Min Li Chan"
      when: "3:08PM"
      notes: " I'll be in your neighborhood doing errands"
    }
    {
      face: "/img/list/60.jpeg"
      what: "Brunch this weekend?"
      who: "Min Li Chan"
      when: "3:08PM"
      notes: " I'll be in your neighborhood doing errands"
    }
  ]
  $scope.data =
    group1: "2"
    group2: "6"

  $scope.data.cb1 = true
  $scope.data.cb2 = false
  $scope.selectedIndex = 0
