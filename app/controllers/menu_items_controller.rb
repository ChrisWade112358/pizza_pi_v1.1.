class MenuItemsController < ApplicationController
    before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

    def index
        @menu_items = MenuItem.all
    end

    def show
        
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
    end

    def update
        @menu_item.update(menu_item_params)
        if @menu_item.save
            redirect_to menu_item_path(@menu_item), notice: "Menu item was successfully edited."
        else
            render 'edit'
        end
    end

    def destroy
        @menu_item.destroy
        redirect_to menu_items_path
    end








    private

        def menu_item_params
            params.require(:menu_item).permit(:name, :description, :price, :category, :image,)
        end

        def set_menu_item
            @menu_item = MenuItem.find(params[:id])
        end
end
