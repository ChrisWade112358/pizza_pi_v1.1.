class CartsController < ApplicationController
    before_action :current_order, only: [:index, :show]
    
    
    def index
        @carts = Cart.all
    end

    def show
        set_subtotal
        set_tax
        set_total
        @cart = Cart.find_by(id: current_cart.id)
        if @order.for_user != nil
            @order_for_name = User.find_by(id: @order.for_user).name
        end
    end

    


end
