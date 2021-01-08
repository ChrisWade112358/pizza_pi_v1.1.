class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItem.all
    end

    def show
        @menu_item = MenuItem.find(params[:id])
    end

    def new
        @menu_item = MenuItem.new
    end

    def create
        
        @menu_item = MenuItem.create(menu_item_params)
        if @menu_item.save
            redirect_to menu_item_path(@menu_item), notice: "Menu item was successfully created."
        else
            render 'new'
        end
    end

    def edit
        @menu_item = MenuItem.find(params[:id])
    end

    def update
        @menu_item = MenuItem.find(params[:id])
        @menu_item.update(menu_item_params)
        if @menu_item.save
            redirect_to menu_item_path(@menu_item), notice: "Menu item was successfully edited."
        else
            render 'edit'
        end
    end

    def destroy
        MenuItem.find(params[:id]).destroy
        redirect_to menu_items_path
    end








    private

        def menu_item_params
            params.require(:menu_item).permit(:name, :description, :price, :category, :image)
        end
end
