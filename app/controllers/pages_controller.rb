class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :how_to, :about_us ]
  def home
  end

  def how_to
  end

  def about_us
  end

end
