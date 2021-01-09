class RemoveDeliveryFeeFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :delivery_fee, :decimal
    add_column :orders, :delivery_fee, :decimal, default: "5.00"
  end
end
