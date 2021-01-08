class Category < ApplicationRecord
    belongs_to :menu_item
    validates :name, presence: true

    

end