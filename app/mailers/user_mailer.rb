class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end

  def creation_confirmation(user)
    user = user
    mail(
      to:       @user.user_id,
      subject:  "Your #{@item.name} was found!!"
    )
  end
end
