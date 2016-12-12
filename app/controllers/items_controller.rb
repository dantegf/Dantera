require 'securerandom'

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def mail
    item = Item.find(params[:id])
    user = User.first
    UserMailer.email_to_owner(item).deliver_now
    redirect_to root_path, notice: "Thank you! The item owner will contact you shortly."
  end

  skip_before_action :authenticate_user!, only: [ :show, :mail ]
  def show
    if params[:search]
      @item = Item.search(params[:search]).first
    end
    if @item.nil?
      redirect_to root_path, notice: 'Sorry, that code is not valid. Try again.'
      #else
      #if current_user.nil?
      #redirect_to new_user_registration_path
      #cookies[:search] = params[:search]
      #end
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge(user: current_user))
    generate_code(@item)
    if @item.valid?
      @item.save
      redirect_to "/items", notice: 'Item successfully created'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
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
    @item.update_attributes(:reward => params[:reward])
    redirect_to '/users/index', :notice => "Well done, " + @item.name + " has been marked as lost."
  end

  private

  def generate_code(item)
    item.code = SecureRandom.hex (3)
  end

  def item_params
     params.require(:item).permit(:name, :code, :reward, :description, :photo, :photo_cache)
  end
end

