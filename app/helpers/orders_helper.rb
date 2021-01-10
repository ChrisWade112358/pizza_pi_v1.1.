module OrdersHelper
    def subtotal
        
        binding.pry
            @order.line_items.each do |line_item|
                if line_item != nil
                    @order.order_subtotal = @order.order_subtotal + line_item.line_item_subtotal        
                else
                    @order.order_subtotal = @order.order_subtotal + 0.00
                end     
            end    
    end

    def total
        if @order.delivery == true
            @order.total = @order.order_subtotal + tax + @order.delivery_fee
        else
            
            @order.total = @order.order_subtotal + tax
        end
    end

    def tax
       
        @order.tax = @order.order_subtotal * @order.tax_rate
    end

    


    private

    def set_subtotal
        subtotal
    end

    def set_total
        total
    end

    
end
