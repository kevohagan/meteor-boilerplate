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
    $('#mainContent').css('display', 'none')
  onAfterAction: ->
    $('#mainContent').velocity('transition.fadeIn',1000)


Router.map ->

  @route 'home',
    path: '/',
    controller: "BasicController",
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

  @route "profile",
    path: "/profile"
    controller: "BasicController"
    template: "profile"

  @route "loginNeeded",
    path: "/loginNeeded"
    template: "loginNeeded"
    onBeforeAction: AccountsTemplates.ensureSignedIn

  @route "contact",
    controller: "BasicController"




#//////////////
# Before Hooks
#//////////////
BeforeHooks =

  scrollUp: ->
    $("body,html").scrollTop 0
    return




#//////////////
# After Hooks
#//////////////
AfterHooks =

  removeSidebar: ->
    $(".ui.sidebar").sidebar "toggle"  if $(".ui.sidebar").hasClass("active")
    return





@BasicController = RouteController.extend(
  layoutTemplate: "layout"
  onBeforeAction: [
    BeforeHooks.scrollUp
  ]
  onAfterAction: [
    AfterHooks.removeSidebar
  ]
)
