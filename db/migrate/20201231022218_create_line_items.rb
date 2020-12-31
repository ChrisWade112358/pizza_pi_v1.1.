class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :order_id, null: false
      t.integer :menu_item_id, null: false
      t.integer :quantity, default: "0"
      t.decimal :line_item_subtotal, default: "0.00", precision: 15, scale: 2
      t.timestamps
    end
    
  end
end
