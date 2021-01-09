class AddMenuItemNameToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :menu_item_name, :string
  end
end
