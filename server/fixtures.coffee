Meteor.startup ->


  if Meteor.users.find().count() is 0

    users = ['test', 'test1', 'test2']

    for user in users
      Accounts.createUser
        username: user
        name: user
        email: user + '@test.com'
        password: "test"
