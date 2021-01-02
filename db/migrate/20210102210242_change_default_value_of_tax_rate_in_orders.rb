class ChangeDefaultValueOfTaxRateInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :tax_rate, :decimal
    add_column :orders, :tax_rate, :decimal, default: "0.07"
  end
end
