class LineItem < ApplicationRecord
    belongs_to :order
    belongs_to :menu_item

    


    def line_item_subtotal
        menu_item.price * quantity
    end


    private

    def set_line_item_subtotal
        self[:line_item_subtotal] = total * quantity
    end
end
