class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items

  after_create :welcome_email

  private
  def welcome_email
    UserMailer.welcome_email(email).deliver_now
  end

end
