class Order < ApplicationRecord
    belongs_to :cart
    has_many :line_items
    has_many :menu_items, through: :line_items
    
    

    def self.cart_orders(id)
        where("cart_id == ?", id)
    end


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
        subtotal 
    end


    private

    def set_subtotal
        self[:order_subtotal] = subtotal
    end

end
