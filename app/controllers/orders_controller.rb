class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :current_cart
    before_action :check_for_cart

    def index
        @orders = Order.all

    end

    def show
    end

    def new
        @menu_items = MenuItem.all
        @current_user = User.find_by(first_name: "Manager's Order")
        @dummy_cart = Cart.find_by(user_id: @current_user)
        @order = Order.new
        @order.line_items.build(quantity: "0")
        @order.line_items.build(quantity: "0")
        @order.line_items.build(quantity: "0")
        @order.line_items.build(quantity: "0")
    end

    def create
        @order = Order.create(order_params)
        current_user = User.find_by(first_name: "Manager's Order")
        current_cart = Cart.find_or_create_by(user_id: current_user.id)
        if @order.save
            l = LineItem.all.select{|a| a.order_id == @order.id}
            l.each do |b|
                b.unit_price = MenuItem.find_by(id: b.menu_item_id).price
                b.menu_item_name = MenuItem.find_by(id: b.menu_item_id).name
                b.line_item_subtotal = b.set_line_item_subtotal
                b.save
                if b.quantity = 0
                    b.delete
                end
            end
            binding.pry
            redirect_to carts_alt_path(@current_cart), notice: "Items added to cart."
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @order.update(order_params)
        @order.save
    end

    def destroy
        @order.destroy
        redirect_to cart_path
    end

   

    private

    def order_params
        params.require(:order).permit(:tax, :delivery, :delivery_fee, :order_subtotal, :total, :datetime, :order_number, :line_item_id, :cart_id, :order_status, :tax_rate,
            line_items_attributes: [
                :quantity,
                :line_item_subtotal,
                :order_id,
                :menu_item_id,
                :unit_price,
            ]
        )
    end

    def set_order
        @order = Order.find_by(id: params[:id])
    end
end
