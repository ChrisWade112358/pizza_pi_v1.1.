module OrdersHelper
    def set_order
        @order = current_order
    end
    
    def subtotal
           @order.order_subtotal = 0.00
           @order.line_items.each do |t|
               @order.order_subtotal = t.line_item_subtotal + @order.order_subtotal
           end   
    end


    def total
        if @order.delivery == true
            @order.total = @order.order_subtotal + @order.tax + @order.delivery_fee
            @order.save        
        else
            
            @order.total = @order.order_subtotal + @order.tax
            @order.save        
        end
    end

    def taxs
       
        @order.tax = @order.order_subtotal * @order.tax_rate
        @order.save
    end

    


    private

    def set_subtotal
        subtotal
    end

    def set_total
        total
    end

    def set_tax

        taxs
    end

    
end
