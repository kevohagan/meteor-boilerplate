Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
  onBeforeAction: ->
    $('meta[name^="description"]').remove()


Router.map ->

  @route 'home',
    path: '/',
    onBeforeAction: ->
      AccountsTemplates.setState "sgin"

  @route 'dashboard',
    path: '/dashboard'

  @route "fullPage",
    path: "/full"
    template: "fullPage"
    onBeforeAction: ->
      AccountsTemplates.setState "sgin"
      return

  @route "aboutPage",
    path: "/about"
    template: "about"

  @route "profilePage",
    path: "/profile"
    template: "profile"

  @route "loginNeeded",
    path: "/loginNeeded"
    template: "loginNeeded"
    onBeforeAction: AccountsTemplates.ensureSignedIn
