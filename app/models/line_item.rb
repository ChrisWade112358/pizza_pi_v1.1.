class LineItem < ApplicationRecord
    has_many :orders
    belongs_to :menu_item
    accepts_nested_attributes_for :orders

    def line_item_subtotal
        unit_price = menu_item.price
        
        self[:line_item_subtotal] = unit_price * quantity
    end


    

    
end
