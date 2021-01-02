class AddOrderStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_status, :boolean, default: true
  end
end
