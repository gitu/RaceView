'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:AppCtrl
 # @description
 # # AppCtrl
 # Controller of the raceViewApp
###
angular.module("raceViewApp").controller "AppCtrl", ($scope, $mdSidenav, $timeout, $mdDialog, menu, $location, $rootScope, simpleLogin, fbutil) ->
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

  $scope.currentUser = null;

  simpleLogin.watch (user) ->
    $scope.currentUser = user
    pictureUrl = null
    switch user.provider
      when "google" then pictureUrl = user.thirdPartyUserData.picture
      when "facebook" then pictureUrl = user.thirdPartyUserData.picture.data.url
      when "github" then pictureUrl = user.thirdPartyUserData.avatar_url
    $scope.currentUser.pictureUrl = pictureUrl
    fbutil.ref('users').child(user.uid).set({
      displayName: user.displayName
      provider: user.provider
      provider_id: user.id
      pictureUrl: profileUrl
      thirdPartyUserData: user.thirdPartyUserData
    })

  return
