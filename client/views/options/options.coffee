Template.options.helpers

  options: ->
    config = AccountsTemplates._config
    options = []
    for option of config
      options.push option  if typeof config[option] is "boolean"
    options

  signup: ->
    AccountsTemplates.getState() is "sgup"






Template.option.helpers
   checked: ->
    AccountsTemplates.getConfig this  if AccountsTemplates.ready()





Template.option.events

 "click input": (event) ->
    if AccountsTemplates.ready()
      currTarg = event.currentTarget
      option = currTarg.id.slice(7) # Skips 'option-'
      AccountsTemplates._config[option] = not AccountsTemplates.getConfig(option)
      $("div.at").remove()
      UI.insert UI.render(Template.signinForm), $("#signinFormDiv").get(0)
    return
