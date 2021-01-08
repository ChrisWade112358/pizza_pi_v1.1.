class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :line_item_id, nul: false
      t.decimal :price. precision: 15, scale: 2, default: "0.0"

      t.timestamps
    end
  end
end
