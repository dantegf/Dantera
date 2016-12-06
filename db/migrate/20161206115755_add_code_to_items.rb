class AddCodeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :code, :string
  end
end
