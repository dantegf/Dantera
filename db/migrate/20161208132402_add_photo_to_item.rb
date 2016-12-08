class AddPhotoToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :photo, :string
  end
end
