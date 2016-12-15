class UserMailer < ApplicationMailer
  def email_to_finder(item, message, email, photo) #<<<<<< here photo params
    @item = item
    @message = message
    @photo = photo #<<<<<< here photo params
    @email = email
    mail(
      to:       email,
      subject:  "Thanks for helping :)"
    )
  end

  def email_to_owner(item, message, phone_number, email, photo)
    @item = item
    @message = message
    @phone_number = phone_number
    @email = email
    @photo = photo #<<<<<< here photo params
    mail(
      to:       item.user.email,
      subject:  "Your #{item.name} was found :D"
    )
  end
end
