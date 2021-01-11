class LineItem < ApplicationRecord
    has_many :orders
    has_many :menu_items
    validates :order_id, :menu_item_id, presence: true


    def set_line_item_subtotal
        self[:line_item_subtotal] = unit_price * quantity
    end


    

    
end
