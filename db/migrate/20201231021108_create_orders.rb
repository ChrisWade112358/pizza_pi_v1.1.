class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :line_item_id, null: false
      t.integer :cart_id, null: false
      t.decimal :tax, default: "0.00", precision: 15, scale: 2
      t.decimal :tax_rate, default: "0.00", precision: 15, scale: 2
      t.boolean :delivery, default: false, null: false
      t.decimal :delivery_fee, default: "0.00", precision: 15, scale: 2
      t.decimal :order_subtotal, default: "0.00", precision: 15, scale: 2
      t.decimal :total, default: "0.00", precision: 15, scale: 2

      t.timestamps
    end
  end
end
