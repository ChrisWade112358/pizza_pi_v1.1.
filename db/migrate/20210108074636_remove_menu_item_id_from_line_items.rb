class RemoveMenuItemIdFromLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :menu_item_id, :integer
    add_column :line_items, :menu_item_id, :integer
  end
end
