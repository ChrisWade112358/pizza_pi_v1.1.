class MenusController < ApplicationController
    before_action :current_cart
    def index
      @menu_items = MenuItem.all
    end
  
    def show
      @menu_item = MenuItem.find(params[:id])
    end
  
  
  
    
  end