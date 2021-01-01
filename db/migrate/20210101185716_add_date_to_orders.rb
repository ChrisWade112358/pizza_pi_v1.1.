class AddDateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :date, :date, null: false
  end
end
