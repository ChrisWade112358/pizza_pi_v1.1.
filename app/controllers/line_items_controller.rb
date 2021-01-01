class LineItemsController < ApplicationController

    def index
        @line_items = LineItem.all
    end

    def show
        @line_item = LineItem.find_by(id: params[:id])
    end
    
    def create
        @menu_item = MenuItem.find_by(id: params[:menu_item_id])
        @quantity = params[:quantity].to_i
        @l_i_subtotal = @menu_item.price * @quantity
        @line_item = LineItem.new(
            order_id: params[:order_id],
            :menu_item_id => params[:menu_item_id],
            quantity: params[:quantity],
            :line_item_subtotal => @l_i_subtotal
            
        )
       
        if @line_item.save
            redirect_to menus_path, notice: "Item added to cart."
        else
            redirect_to menus_path, notice: "Item NOT added to cart."
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
        params.require(:line_item).permit(
            :quantity,
            :menu_item_id,
            :order_id,
            :line_item_subtotal
    
        )
    end
end
