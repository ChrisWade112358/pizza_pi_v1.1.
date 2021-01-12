class AddFakeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :fake, :boolean, default: false
  end
end
