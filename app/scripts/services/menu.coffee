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
  simpleLogin.watch (user) ->
    isLoggedIn = !!user
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
        }
      ]
    }
    {
      name: "Race Manage"
      pages: [
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
      return self.isSectionSelected(section) if !page.show
      return false if !self.isSectionSelected(section)
      return !isLoggedIn if page.show is 'noauth'
      return isLoggedIn if page.show is 'auth'
  }

  self
