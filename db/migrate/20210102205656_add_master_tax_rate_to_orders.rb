class AddMasterTaxRateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :master_tax_rate, :decimal
  end
end
