class Order < ApplicationRecord
    belongs_to :cart
    has_many :line_items
    has_many :menu_items, through: :line_items
    before_save :set_subtotal
    
    

    def self.cart_orders(id)
        where("cart_id == ?", id)
    end


end
