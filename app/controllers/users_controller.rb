class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # @user = current_user.user.build(user_params)
    # if @user.save
    #   UserMailer.creation_confirmation(@user).deliver_now
    #   redirect_to user_path(@user)
    # else
    #   render :new
    # end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
