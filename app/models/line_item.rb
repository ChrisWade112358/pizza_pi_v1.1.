class LineItem < ApplicationRecord
    has_many :orders
    has_many :ingredients
    belongs_to :menu_item


    def line_item_subtotal
        unit_price = menu_item.price
        
        self[:line_item_subtotal] = unit_price * quantity
    end


    

    
end
