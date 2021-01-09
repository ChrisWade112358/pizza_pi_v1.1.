class LineItemsController < ApplicationController
    before_action :current_order
    before_action :set_order, only:[:index, :show, :create, :update]
    after_action :set_subtotal, only: [:create, :update, :destroy]
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]

    def index
        @line_items = LineItem.all
    end

    def show
    end
    
    def create
        @line_item = LineItem.create(line_item_params)
        if @line_item.save
            @line_item.line_item_subtotal = set_line_item_subtotal
            redirect_to cart_path(@current_cart), notice: "Item added to cart."
        else
            redirect_to menu_path(@menu_item), alert: "Item did not add to cart."
        end    
    end

    def update
        if @line_item.update(line_item_params)
            
            redirect_to cart_path(@current_cart)
        else
            redirect_to cart_path(@current_cart), alert: "Item did NOT update."
        end
        
    end

    def destroy
        @line_item.destroy
        redirect_to cart_path(@current_cart), notice: "Item deleted from Cart."
    end




    private

    def line_item_params
        params.require(:line_item).permit(:menu_item_id, :quantity, :order_id, :unit_price, :line_item_subtotal, :menu_item_name
    
        )
    end

    def set_line_item
        @line_item = LineItem.find_by(id: params[:id])
    end
end
