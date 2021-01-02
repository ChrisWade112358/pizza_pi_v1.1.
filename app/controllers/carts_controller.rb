class CartsController < ApplicationController
    before_action :current_order
    
    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find_by(id: current_cart.id)
    end
end
