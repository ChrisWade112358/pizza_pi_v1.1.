module LineItemsHelper

    def set_line_item_subtotal
        binding.pry
        @line_item.line_item_subtotal = @line_item.unit_price * @line_item.quantity
    end

    
end