class RemoveDateFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :date, :date
    add_column :orders, :datetime, :datetime
  end
end
