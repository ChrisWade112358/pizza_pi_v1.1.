class RemoveCatgoriesFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :category, :string
    add_column :menu_items, :category_id, :integer
  end
end
