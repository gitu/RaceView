'use strict'

###*
 # @ngdoc service
 # @name raceViewApp.menu
 # @description
 # # menu
 # Factory in the raceViewApp.
###
angular.module("raceViewApp").factory "menu", ($location, $rootScope, simpleLogin) ->
  isLoggedIn = false;
  isConfinale = false;
  simpleLogin.watch (user) ->
    isLoggedIn = !!user
    isConfinale = !!user && user.provider == 'google' && user.thirdPartyUserData.hd == 'confinale.ch'
    return
  sortByName = (a, b) ->
    (if a.name < b.name then -1 else 1)
  sortByHumanName = (a, b) ->
    (if (a.humanName < b.humanName) then -1 else (if (a.humanName > b.humanName) then 1 else 0))
  onLocationChange = ->
    activated = false
    path = $location.path()
    sections.forEach (section) ->
      section.pages.forEach (page) ->
        if path is page.url
          self.selectSection section
          self.selectPage section, page
          activated = true
        return
      return
    self.selectSection sections[3]  unless activated
    return
  sections = [
    {
      name: "Race View"
      pages: [
        {
          name: "Current Race"
          id: "current"
          url: "/current"
          show: 'auth'
        }
        {
          name: "Driver Display"
          id: "driverDisplay"
          url: "/driver-display"
          show: 'auth'
        }
        {
          name: "Last Race"
          id: "lastRaceTable"
          url: "/last-race"
          show: 'auth'
        }
        {
          name: "Last Qualifying"
          id: "lastQualiTable"
          url: "/last-quali"
          show: 'auth'
        }
      ]
    }
    {
      name: "Race Manage"
      pages: [
        {
          name: "Participants"
          id: "participants"
          url: "/participants"
          show: 'auth'
        }
        {
          name: "Login"
          id: "login"
          url: "/login"
          show: 'noauth'
        }
        {
          name: "Account"
          id: "account"
          url: "/account"
          show: 'auth'
        }
      ]
    }
  ]

  $rootScope.$on "$locationChangeSuccess", onLocationChange
  self = {
    sections: sections
    selectSection: (section) ->
      self.openedSection = section
      return

    toggleSelectSection: (section) ->
      self.openedSection = ((if self.openedSection is section then null else section))
      return

    isSectionSelected: (section) ->
      self.openedSection is section

    selectPage: (section, page) ->
      page and page.url and $location.path(page.url)
      self.currentSection = section
      self.currentPage = page
      return

    isPageSelected: (section, page) ->
      self.currentPage is page

    showPage: (section, page) ->
      return true if !page.show
      return !isLoggedIn if page.show is 'noauth'
      return isLoggedIn if page.show is 'auth'
      return isConfinale if page.show is 'confinaleOnly'

    isConfinale: () ->
      return isConfinale

    goto: (url) ->
      $location.path(url)
  }

  self
