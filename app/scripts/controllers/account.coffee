"use strict"

###
@ngdoc function
@name muck2App.controller:AccountCtrl
@description
# AccountCtrl
Provides rudimentary account management functions.
###
angular.module("raceViewApp").controller "AccountCtrl", ($scope, user, simpleLogin, fbutil, $timeout, $mdDialog) ->
  $scope.user = user
  loadProfile = (user) ->
    $scope.user = user
    $scope.profile.$destroy()  if $scope.profile
    $scope.publicProfile.$destroy()  if $scope.publicProfile
    $scope.profile = fbutil.syncObject("users/" + user.uid)
    $scope.publicProfile = fbutil.syncObject("publicUsers/" + user.uid)
    return

  $scope.logout = simpleLogin.logout
  $scope.alert = undefined
  loadProfile user if user.provider == "password"

  $scope.$watch 'profile.name', (newValue) ->
    if newValue? && user.provider == "password"
      console.log('set username')
      $scope.publicProfile.displayName = newValue
      $scope.publicProfile.$save()

  $scope.showChangePasswordDialog = (ev) ->
    $mdDialog.show(
      templateUrl: "views/account.pwd.html"
      targetEvent: ev
      controller: ChangeSimpleUserCtrl
    ).then (->
      $scope.alert = answer
      return
    ), ->
      $scope.alert = "You cancelled the dialog."
      return
    return

  $scope.showChangeEmailDialog = (ev) ->
    $mdDialog.show(
      templateUrl: "views/account.email.html"
      targetEvent: ev
      controller: ChangeSimpleUserCtrl
    ).then (->
      $scope.alert = answer
      return
    ), ->
      $scope.alert = "You cancelled the dialog."
      return
    return

  ChangeSimpleUserCtrl = ($scope, $mdDialog) ->
    $scope.messages = []
    $scope.hide = ->
      $mdDialog.hide()
      return
    $scope.answer = (answer) ->
      $mdDialog.hide answer
      return
    error = (err) ->
      alert err, "danger"
      return
    success = (msg) ->
      alert msg, "success"
      return
    alert = (msg, type) ->
      obj =
        text: msg
        type: type
      $scope.messages.unshift obj
      $timeout (->
        $scope.messages.splice $scope.messages.indexOf(obj), 1
        return
      ), 10000

    $scope.changeEmail = (pass, newEmail) ->
      $scope.err = null
      simpleLogin.changeEmail(pass, newEmail).then ((user) ->
        loadProfile user
        success "Email changed"
        $mdDialog.hide "Email changed"
        return
      ), error
      return

    $scope.changePassword = (oldPass, newPass, confirm) ->
      $scope.err = null
      if not oldPass or not newPass
        error "Please enter all fields"
      else if newPass isnt confirm
        error "Passwords do not match"
      else
        simpleLogin.changePassword(user.email, oldPass, newPass).then (->
          success "Password changed"
          $mdDialog.hide "Password changed"
          return
        ), error
      return
    return
