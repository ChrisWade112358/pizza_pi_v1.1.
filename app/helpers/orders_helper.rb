module OrdersHelper
    def subtotal
        
        subtotal = 0.00
        if @line_items != nil
            @line_items.each do |line_item|
                binding.pry
                if line_item != nil
                    a = line_item.unit_price * line_item.quantity
                    subtotal += a
                else
                    a = 0.00
                    subtotal += a
                end
            end
        end
        binding.pry
        subtotal 
    end


    private

    def set_subtotal
        binding.pry
        self[:order_subtotal] = subtotal
    end
end
