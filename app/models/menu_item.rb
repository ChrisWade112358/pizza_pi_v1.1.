class MenuItem < ApplicationRecord
   validates :name, presence: true, uniquesness: true

    CATEGORY = ['Pizza', 'Side', 'Drink', 'Dessert', 'Wings']
end
