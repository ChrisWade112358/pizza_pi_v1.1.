class CartsController < ApplicationController
    before_action :current_order
    before_action :set_subtotal
    before_action :set_total
    
    
    def index
        @carts = Cart.all
    end

    def show
        @order.save
        binding.pry
        @cart = Cart.find_by(id: current_cart.id)
    end
end
