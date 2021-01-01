class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find_by(id: params[:id])
    end

    def destroy
        @order = Order.find_by(id: params[:id]) 
        redirect_to cart_path
    end
end
