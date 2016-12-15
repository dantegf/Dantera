class UserMailer < ApplicationMailer
  def email_to_finder(item, message, email)
    @item = item
    @message = message
    @email = email
    mail(
      from:     'Dantera.org',
      to:       email,
      subject:  "Thanks for helping :)"
    )
  end

  def email_to_owner(item, message, phone_number, email)
    @item = item
    @message = message
    @phone_number = phone_number
    @email = email
    mail(
      to:       item.user.email,
      subject:  "Your #{item.name} was found :D"
    )
  end
end
