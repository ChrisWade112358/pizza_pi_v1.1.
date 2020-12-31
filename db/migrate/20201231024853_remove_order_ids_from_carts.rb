class RemoveOrderIdsFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :order_ids, :text
    add_column :carts, :order_id, :text
  end
end
