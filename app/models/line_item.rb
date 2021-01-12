class LineItem < ApplicationRecord
    belongs_to :order
    belongs_to :menu_item
    
  


    def set_line_item_subtotal
        self[:line_item_subtotal] = unit_price * quantity
    end


    
    def unit_price
        if persisted?
            self[:unit_price]
        else
            binding.pry
            menu_item.price
        end
    end

    


    private

    def set_unit_price
        slef[:unit_price] = unit_price
    end

    def set_line_item_subtotal
        @line_item.line_item_subtotal = @line_item.unit_price * @line_item.quantity
    end
    
end
