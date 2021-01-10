class CartsController < ApplicationController
    before_action :current_order, only: [:index, :show]
    before_action :set_subtotal
    before_action :set_total
    
    
    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find_by(id: current_cart.id)
    end

    


end
