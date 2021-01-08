class LineItemsController < ApplicationController
    before_action :current_order
    before_action :set_order, only:[:index, :show, :create, :update]
    after_action :set_subtotal, only: [:create, :update, :destroy]
    

    def index
        @line_items = LineItem.all
    end

    def show
        @line_item = LineItem.find_by(id: params[:id])
    end
    
    def create
        binding.pry
        @line_item = LineItem.create(line_item_params)
        if @line_item.save
            @order.line_item_id = @line_item.id
            @order.save
            redirect_to cart_path(@current_cart), notice: "Item added to cart."
        else
            redirect_to menu_path(@menu_item), alert: "Item did not add to cart."
        end    
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
        params.require(:line_item).permit(:menu_item_id, :quantity, :order_id,
            ingredient_attributes: [:name, :price]
        )
    end
end
