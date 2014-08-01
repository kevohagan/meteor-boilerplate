Meteor.publish "userData", ->
  return User.find({},
    fields:
      username: 1
      friend_ids: 1
      createdAt: 1
  )
  User.find()

Meteor.users.allow update: (user_id, doc, fields, modifier) ->
  if doc._id isnt Meteor.userId()
    false
  else
    true





# Have fun with users on registering

# Accounts.onCreateUser (options, user) ->

#   # give the user a "username" based on the initial part of their email address
#   user.username = User.init(user).email().split("@")[0]
#   user.profile = options.profile  if options.profile
#   user