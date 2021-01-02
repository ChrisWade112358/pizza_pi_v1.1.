class LineItemsController < ApplicationController
    before_action :current_order, only: [:create, :update, :destroy]

    def index
        @line_items = LineItem.all
    end

    def show
        @line_item = LineItem.find_by(id: params[:id])
    end
    
    def create
        @order = current_order
        @line_item = @order.line_items.new(line_item_params)
        @order.save
    end

    def update
        @line_item = LineItem.find_by(id: params[:id])
        if @line_item.update(line_item_params)
            redirect_to cart_path(@current_cart)
        else
            redirect_to cart_path(@current_cart), alert: "Item did NOT update."
        end
        
    end

    def destroy
        @line_item = LineItem.find_by(id: params[:id]).destroy
        redirect_to cart_path(@current_cart), notice: "Item deleted from Cart."
    end




    private

    def line_item_params
        params.require(:line_item).permit(
            :quantity,
            :menu_item_id,
            :order_id,
            :line_item_subtotal
    
        )
    end
end
