class Item < ApplicationRecord
  belongs_to :user

  def self.search(search)
    where("code LIKE ?", "%#{search}%")
  end
end
