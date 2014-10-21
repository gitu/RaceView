'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:AppCtrl
 # @description
 # # AppCtrl
 # Controller of the raceViewApp
###
angular.module("raceViewApp").controller "AppCtrl", ($scope, $mdSidenav, $timeout, $mdDialog, menu, $location, $rootScope) ->
  openPage = ->
    $scope.closeMenu()
    mainContentArea.focus()
    return
  $scope.menu = menu
  mainContentArea = document.querySelector("[role='main']")
  $rootScope.$on "$locationChangeSuccess", openPage
  $scope.closeMenu = ->
    $timeout ->
      $mdSidenav("left").close()
      return

    return

  $scope.openMenu = ->
    $timeout ->
      $mdSidenav("left").open()
      return

    return

  $scope.path = ->
    $location.path()

  $scope.goHome = ($event) ->
    menu.selectPage null, null
    $location.path "/"
    return

  return
