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

    def update
        @order = Order.find_by(id: params[:id]) 
        @order.update(order_params)
        @order.save
    end

    private

    def menu_item_params
        params.require(:order).permit(:tax, :delivery, :delivery_fee, :order_subtotal, :total, :datetime, :order_number, :line_item_id, :cart_id, :order_status, :tax_rate)
    end
end
