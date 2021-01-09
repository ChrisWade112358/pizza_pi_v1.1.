class MenuItem < ApplicationRecord
    belongs_to :line_item
    has_many :orders, through: :line_items 

    CATEGORY = ['Pizza', 'Side', 'Drink', 'Dessert', 'Wings']
end
