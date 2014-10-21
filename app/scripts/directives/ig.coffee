'use strict'

###*
 # @ngdoc directive
 # @name raceViewApp.directive:ig
 # @description
 # # ig
###
angular.module('raceViewApp')
.directive "ig", ->
  restrict: "E"
  replace: true
  scope:
    fid: "@"
  template: "<md-input-group>" + "<label for=\"{{fid}}\">Description</label>" + "<md-input id=\"{{fid}}\" type=\"text\" ng-model=\"data.description\">" + "</md-input-group>"

