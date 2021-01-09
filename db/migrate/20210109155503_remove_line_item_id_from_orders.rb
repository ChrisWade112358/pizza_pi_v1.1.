class RemoveLineItemIdFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :line_item_id, :integer
  end
end
