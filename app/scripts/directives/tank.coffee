'use strict'

###*
 # @ngdoc directive
 # @name raceViewApp.directive:tank
 # @description
 # # tank
###
angular.module('raceViewApp')
.directive('tank', ->
  restrict: 'E'
  scope:
    tankLevel: '='
    tankWidth: '@'
  link: (scope, element, attr) ->
    barWidth = 20
    chartInset = 0
    numSections = 5

    # / 2 for HALF circle
    sectionPerc = 1 / numSections / 2
    padRad = 0.05


    # start at 270deg
    totalPercent = .75

    el = d3.select(element[0])

    margin = { top: 2, right: 2, bottom: 3, left: 2 }
    width = scope.tankWidth - margin.left - margin.right
    height = width
    radius = width / 2

    console.log({
      margin: margin
      width: width
      height: height
      radius: radius
    })

    percToDeg = (perc) ->
      perc * 360

    percToRad = (perc) ->
      degToRad percToDeg perc

    degToRad = (deg) ->
      deg * Math.PI / 180

    svg = el.append('svg')
    .attr('width', width + margin.left + margin.right)
    .attr('height', height / 2 + radius / 10 + margin.top + margin.bottom)

    scope.chart = svg.append('g')
    .attr('transform', "translate(#{(width + margin.left) / 2}, #{(height + margin.top) / 2})")

    scope.chart
    .append("svg:image")
    .attr("xlink:href", "/images/icon_156.svg")
    .attr("x", -radius / 6)
    .attr("y", -radius / 2)
    .attr("height", radius / 3)
    .attr("width", radius / 3);


    # build gauge bg
    for sectionIndx in [1..numSections]

      arcStartRad = percToRad totalPercent
      arcEndRad = arcStartRad + percToRad sectionPerc
      totalPercent += sectionPerc

      startPadRad = if sectionIndx is 0 then 0 else padRad / 2
      endPadRad = if sectionIndx is numSections then 0 else padRad / 2

      arc = d3.svg.arc()
      .outerRadius(radius - chartInset)
      .innerRadius(radius - chartInset - barWidth)
      .startAngle(arcStartRad + startPadRad)
      .endAngle(arcEndRad - endPadRad)

      scope.chart.append('path')
      .attr('class', "arc tank-color#{sectionIndx}")
      .attr('d', arc)

    class Needle

      constructor: (@len, @radius) ->

      drawOn: (el, perc) ->
        el.append('circle')
        .attr('class', 'needle-center')
        .attr('cx', 0)
        .attr('cy', 0)
        .attr('r', @radius)


        el.append('path')
        .attr('class', 'needle')
        .attr('d', @mkCmd(perc))

      animateOn: (el, perc) ->
        self = this
        el
        .transition()
        .delay(500)
        .ease('elastic')
        .duration(2000)
        .selectAll('.needle')
        .tween('progress', ->
          (percentOfPercent) ->
            progress = percentOfPercent * perc
            d3
            .select(this)
            .attr('d', self.mkCmd progress)
        )

      mkCmd: (perc) ->
        thetaRad = percToRad perc / 2 # half circle

        centerX = 0
        centerY = 0

        topX = centerX - @len * Math.cos(thetaRad)
        topY = centerY - @len * Math.sin(thetaRad)

        leftX = centerX - @radius * Math.cos(thetaRad - Math.PI / 2)
        leftY = centerY - @radius * Math.sin(thetaRad - Math.PI / 2)

        rightX = centerX - @radius * Math.cos(thetaRad + Math.PI / 2)
        rightY = centerY - @radius * Math.sin(thetaRad + Math.PI / 2)

        "M #{leftX} #{leftY} L #{topX} #{topY} L #{rightX} #{rightY}"

    scope.needle = new Needle radius, radius / 10
    scope.needle.drawOn scope.chart, 0
    return

  controller: ($scope) ->
    $scope.$watch "tankLevel", (newValue) ->
      $scope.needle.animateOn $scope.chart, newValue / 15
)
