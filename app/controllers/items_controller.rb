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
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
