class AddLostMessageToItems < ActiveRecord::Migration[5.0]
    def change
    add_column :items, :lost_message, :string
  end
end
