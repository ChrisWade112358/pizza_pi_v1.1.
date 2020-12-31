class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id, null:false
      t.text :order_ids

      t.timestamps
    end
  end
end
