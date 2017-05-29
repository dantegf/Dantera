class UserMailer < ApplicationMailer

  def email_to_finder(item, message, email)
    @item = item
    @message = message
    @email = email
    mail(
      to:       email,
      bcc:      'dante.fereghetti@gmail.com',
      reply_to: 'dante.fereghetti@gmail.com',
      subject:  "Thanks for helping!",
      track_opens: 'true'
    )
  end

  def email_to_owner(item, message, phone_number, email)
    @item = item
    @message = message
    @phone_number = phone_number
    @email = email
    mail(
      to:       item.user.email,
      bcc:      'dante.fereghetti@gmail.com',
      reply_to: 'dante.fereghetti@gmail.com',
      subject:  "Your #{item.name} was found! :D",
      track_opens: 'true'
    )
  end

  def welcome_email(email)
    @email = email
    @dante = 'dante.fereghetti@gmail.com'
    mail(
       to:       email,
       bcc:      'dante.fereghetti@gmail.com',
       reply_to: 'dante.fereghetti@gmail.com',
       subject:  "Welcome to Dantera!",
       track_opens: 'true'
     )
  end

end
