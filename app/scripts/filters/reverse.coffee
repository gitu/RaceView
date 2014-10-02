"use strict"
angular.module("raceViewApp").filter "reverse", ->
  (items) ->
    if angular.isArray(items) then items.slice().reverse() else []