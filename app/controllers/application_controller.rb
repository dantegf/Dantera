class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    item_code = cookies[:search]
    items_show_path({search: item_code})
  end

end
