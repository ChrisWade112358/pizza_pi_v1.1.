class MenuItem < ApplicationRecord
   validates :name, presence: true

    CATEGORY = ['Pizza', 'Side', 'Drink', 'Dessert', 'Wings']
end
