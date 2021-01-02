class Order < ApplicationRecord
    belongs_to :cart
    has_many :line_items
    has_many :menu_items, through: :line_items
    before_save :set_subtotal
    

    def self.cart_orders(id)
        where("cart_id == ?", id)
    end


    def subtotal
        binding.pry
        line_items.collect{|line_item| line_item.valid? ? line_item.price * line_item.quantity : 0}.sum
    end


    private

    def set_subtotal
        self[:subtotal] = subtotal
    end

end
