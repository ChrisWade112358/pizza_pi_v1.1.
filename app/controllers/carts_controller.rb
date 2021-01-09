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

    def alt_show
        @current_user = User.find_by(first_name: "Manager's Order")
        @current_cart = Cart.find_or_create_by(user_id: current_user.id)
        @current_order = Order.find_or_create_by(cart_id: current_cart.id)
        binding.pry
    end


end
