class AddDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :description, :string
  end
end
