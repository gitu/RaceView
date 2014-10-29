'use strict'

###*
 # @ngdoc overview
 # @name raceViewApp
 # @description
 # # raceViewApp
 #
 # Main module of the application.
###
angular
.module('raceViewApp', [
    'ngMaterial',
    'ngRoute',
    'firebase',
    'firebase.utils',
    'simpleLogin',
    'angularytics',
    'ui.gravatar'
  ])
.run ->
  FastClick.attach document.body

.config (AngularyticsProvider) ->
  AngularyticsProvider.setEventHandlers(['Console', 'GoogleUniversal']);
###
run(Angularytics) ->
  Angularytics.init()
###
