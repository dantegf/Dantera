class AddMessageToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :message, :string
  end
end
