'use strict'

###*
 # @ngdoc function
 # @name raceViewApp.controller:AppCtrl
 # @description
 # # AppCtrl
 # Controller of the raceViewApp
###
angular.module("raceViewApp").controller "AppCtrl", ($scope, $mdSidenav, $timeout, $mdDialog, menu, $location, $rootScope, simpleLogin, fbutil, $filter, gravatarService) ->
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
    if !!user
      pictureUrl = switch user.provider
        when "google" then user.thirdPartyUserData.picture
        when "facebook" then user.thirdPartyUserData.picture.data.url
        when "github" then user.thirdPartyUserData.avatar_url
        else
          gravatarService.url(user.email)
      name = user.name;
      if not name?
        name = switch user.provider
          when "google" then user.displayName
          when "facebook" then user.displayName
          when "github" then user.thirdPartyUserData.name
          when "password" then user.email
      $scope.currentUser.pictureUrl = pictureUrl
      $scope.currentUser.displayName = name
      if user.provider == 'password'
        fbutil.ref('publicUsers').child(user.uid).child('pictureUrl').set(pictureUrl);
        fbutil.ref('publicUsers').child(user.uid).child('timestamp').set(Firebase.ServerValue.TIMESTAMP);
      else
        fbutil.ref('users').child(user.uid).set({
          displayName: name
          provider: user.provider
          provider_id: user.id
          pictureUrl: pictureUrl
          thirdPartyUserData: user.thirdPartyUserData
        })
        fbutil.ref('publicUsers').child(user.uid).set({
          displayName: name
          pictureUrl: pictureUrl
          timestamp: Firebase.ServerValue.TIMESTAMP
        });
      console.log('logged in as: ' + name)

      $timeout ->
        if $scope.canAddToRaceList(user)
          $scope.requestRaceParticipation(user)
      , 500



  $scope.raceRequests = fbutil.syncArray('raceRequests')
  $scope.users = fbutil.syncObject('publicUsers')
  $scope.cars = fbutil.syncObject('cars')
  $scope.canAddToRaceList = (user) ->
    if user?
      filteredRequests = $filter('filter')($scope.raceRequests, {uid: user.uid})
      return true if filteredRequests.length == 0
      return filteredRequests[0].timestamp < new Date().getTime() - 60000
    return false


  $scope.requestRaceParticipation = (user) ->
    return if not user?
    filteredRequests = $filter('filter')($scope.raceRequests, {uid: user.uid})
    if filteredRequests.length > 0
      $scope.raceRequests.$remove(filteredRequests[0])
    $scope.raceRequests.$add({
      uid: user.uid
      timestamp: Firebase.ServerValue.TIMESTAMP
    });

  $scope.lastRace = {};
  $scope.lastQualifying = {};
  $scope.race = {};
  $scope.qualifying = {};

  $scope.trackState = fbutil.syncObject(['trackState']);
  fbutil.syncObject('lastRace').$bindTo($scope, 'lastRace');
  fbutil.syncObject('lastQualifying').$bindTo($scope, 'lastQualifying');

  $scope.$watch 'lastQualifying', (value) ->
    if value != undefined && value.$value != undefined
      $scope.qualifying = fbutil.syncObject(['races', value.$value]);

  $scope.$watch 'lastRace', (value) ->
    if value != undefined && value.$value != undefined
      $scope.race = fbutil.syncObject(['races', value.$value]);

  return
