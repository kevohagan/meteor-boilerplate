Template.contact.rendered = ->

  $(".ui.form").form
    name:
      identifier: "name"
      rules: [
        type: "empty"
        prompt: "Please enter your name"
      ]

    email:
      identifier: "email"
      rules: [
        type: "email"
        prompt: "Please enter your email address"
      ]

    text:
      identifier: "message"
      rules: [
        type: "empty"
        prompt: "Please enter your message"
      ]
  ,
    inline: true
    on: "blur"
    onSuccess: =>
      name = $("#contact-name").val()
      email = $("#contact-email").val()
      message = $("#contact-message").val()

      title = "New Message from #{name}"

      Meteor.call "sendEmail", "info@moormeds.com", email , title , message, (err,res) ->
        if err
          console.log err
        else
          console.log res

      button = $("#contact-form .submit")
      button.html "Sending.."
      setTimeout (->
        button.html "Thank you very much!"
        $('#contact-name').val("")
        $('#contact-email').val("")
        $('#contact-message').val("")
        return
      ), 1000
  return





