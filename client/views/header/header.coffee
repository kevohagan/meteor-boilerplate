Template.header.rendered = ->

  $(".ui.sidebar").sidebar(
    overlay: false
    duration: "2000"
  )
  .sidebar "attach events", "#close", "hide"
  .sidebar "attach events", "#btn", "toggle"
  .sidebar "attach events", "#mainContent", 'hide'

  return


Template.header.events
  'click #logout': () ->
    Meteor.logout()
    Router.go('home')
