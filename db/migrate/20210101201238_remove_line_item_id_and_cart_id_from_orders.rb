class RemoveLineItemIdAndCartIdFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :line_item_id, :integer
    remove_column :orders, :cart_id, :integer
    add_column :orders, :line_item_id, :integer
    add_column :orders, :cart_id, :integer
  end
end
