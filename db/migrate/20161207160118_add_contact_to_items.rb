class AddContactToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :contact, :string
  end
end
