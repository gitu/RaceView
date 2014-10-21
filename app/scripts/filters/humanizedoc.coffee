'use strict'

###*
 # @ngdoc filter
 # @name raceViewApp.filter:humanizeDoc
 # @function
 # @description
 # # humanizeDoc
 # Filter in the raceViewApp.
###
angular.module('raceViewApp')
.filter 'humanizeDoc', ->
  (doc) ->
    return  unless doc
    if doc.type is "directive"
      return doc.name.replace(/([A-Z])/g, ($1) ->
        "-" + $1.toLowerCase()
      )
    doc.label or doc.name
