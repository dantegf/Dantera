class UserMailer < ApplicationMailer
  def email_to_finder(item, message, email)
    mail(
      to:       email,
      subject:  "You have found #{item.name}!!"
    )
  end

  def email_to_owner(item, message, phone_number, email)
    mail(
      to:       item.user.email,
      subject:  "Your #{item.name} was found!!"
    )
  end
end
