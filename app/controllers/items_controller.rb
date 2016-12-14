require 'securerandom'

class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :mail, :new, :create ]

  def index
    @items = Item.where(user_id: current_user.id)
  end

  def print
    @item = Item.find(params[:id])
    respond_to do |format|
      format.pdf do
       render pdf: "Sticker for #{@item.name}"
      end
    end
  end

  def mail
    item = Item.find(params[:item_id])
    user = User.first
    message = params[:message]
    phone_number = params[:phone_number]
    email = params[:email]
    UserMailer.email_to_finder(item, message, email).deliver_now
    UserMailer.email_to_owner(item, message, phone_number, email).deliver_now
    redirect_to root_path, notice: "Thank you! The item owner will contact you shortly."
  end

  def show
    if params[:search] == ""
      redirect_to root_path, notice: 'Sorry, please insert a code. Try again.'
    end
    if params[:search]
      @item = Item.search(params[:search]).first
    end
    if @item.nil?
      redirect_to root_path, notice: 'Sorry, that code is not valid. Try again.'
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge(user: current_user))
    if current_user
      generate_code(@item)
      if @item.valid?
        @item.save
        redirect_to "/items", notice: 'Item successfully created'
      else
        render :new
      end
    else
      cookies[:item] = {name: params[:item][:name], description: params[:item][:description], reward: params[:item][:reward],
     contact: params[:item][:contact], photo: params[:item][:photo]}.to_json
      redirect_to new_user_registration_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    @items_display = Item.where(user_id: current_user.id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:name])
     redirect_to :action => 'show', :id => @item
    else
     @item = item.find(:all)
     render :action => 'edit'
    end

  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to '/items', :notice => "Your item has been deleted"
  end

  def report_lost
    @item = Item.find(params[:id])
    @item.update_attributes(reward: params[:reward], lost_message: params[:lost_message])

    redirect_to '/items', :notice => "Well done, " + @item.name + " has been marked as lost."
  end

  private

  def generate_code(item)
    item.code = SecureRandom.hex (3)
  end

  def item_params
     params.require(:item).permit(:name, :lost_message, :code, :reward, :description, :photo, :photo_cache)
  end
end
