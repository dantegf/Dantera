class OurDevise::RegistrationsController < Devise::RegistrationsController
  protected

    def after_sign_up_path_for(resource)
    if cookies[:item].present?
      item_hash = JSON.parse(cookies["item"]).with_indifferent_access
      code = SecureRandom.hex (3)
      item = Item.new(user_id: current_user.id, name:item_hash[:name], description:item_hash[:description], code: code, message:item_hash[:message], reward:item_hash[:reward], contact:item_hash[:contact], photo:item_hash[:photo])
      item.save!
    end
      items_path
  end
end
