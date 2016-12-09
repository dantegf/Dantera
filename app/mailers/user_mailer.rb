class UserMailer < ApplicationMailer
  def email_to_owner(item)
    #@user = user
    mail(
      to:       item.user.email,
      subject:  "Your #{item.name} was found!!"
    )
  end
end
