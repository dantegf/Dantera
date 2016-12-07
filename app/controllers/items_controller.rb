require 'securerandom'

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    if params[:search]
      @items = Item.search(params[:search])
    else
      nil
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
      redirect_to @item, notice: 'Item successfully created'
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
    redirect_to '/items/new', :notice => "Your item has been deleted"
  end

  private

  def generate_code(item)
    item.code = SecureRandom.hex (3)
  end

  def item_params
     params.require(:item).permit(:name, :code)
  end
end

