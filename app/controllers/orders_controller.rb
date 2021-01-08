class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
        @orders = Order.all
    end

    def show
    end

    def destroy
        @order.destroy
        redirect_to cart_path
    end

    def edit
    end

    def update
        @order.update(order_params)
        @order.save
    end

    private

    def menu_item_params
        params.require(:order).permit(:tax, :delivery, :delivery_fee, :order_subtotal, :total, :datetime, :order_number, :line_item_id, :cart_id, :order_status, :tax_rate)
    end

    def set_order
        @order = Order.find_by(id: params[:id])
    end
end
