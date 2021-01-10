class CartsController < ApplicationController
    before_action :current_order, only: [:index, :show]
    before_action :set_subtotal
    before_action :set_total
    
    
    def index
        @carts = Cart.all
    end

    def show
        binding.pry
        @cart = Cart.find_by(id: current_cart.id)
        @order_for_name = User.find_by(id: @order.for_user).name
    end

    


end
