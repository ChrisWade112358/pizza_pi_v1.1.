class LineItem < ApplicationRecord
    belongs_to :order
    has_many :menu_items


    def set_line_item_subtotal
        self[:line_item_subtotal] = unit_price * quantity
    end


    

    
end
