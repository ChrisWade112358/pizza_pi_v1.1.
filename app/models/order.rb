class Order < ApplicationRecord
    belongs_to :cart
    has_many :line_items
    has_many :menu_items, through: :line_items
    accepts_nested_attributes_for :line_items
    scope :good_orders, -> {where("total != 0")}
    scope :orders_by_cart, ->(cart) {where("cart_id == ?", cart)}
    validates :cart_id, presence: true
   
    
    
    
    

    def self.cart_orders(id)
        where("cart_id == ?", id)
    end


end
