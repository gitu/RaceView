'use strict'

###*
 # @ngdoc filter
 # @name raceViewApp.filter:directiveBrackets
 # @function
 # @description
 # # directiveBrackets
 # Filter in the raceViewApp.
###
angular.module('raceViewApp')
.filter 'directiveBrackets', ->
  (str) ->
    return "<" + str + ">"  if str.indexOf("-") > -1
    str
