class Item < ApplicationRecord
  validates :code, uniqueness: true
  validates :name, presence: true
  belongs_to :user

  def self.search(search)
    where("code LIKE ?", "%#{search}%")
  end

  mount_uploader :photo, PhotoUploader
end
