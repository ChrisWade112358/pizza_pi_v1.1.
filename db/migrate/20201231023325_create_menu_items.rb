class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.text :description
      t.string :category, null: false
      t.string :image
      t.decimal :price, default: "0.00", precision 15, scale: 2

      t.timestamps
    end
  end
end
