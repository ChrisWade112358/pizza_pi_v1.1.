class AddForUserToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :for_user, :integer
  end
end
