class MenusController < ApplicationController
    before_action :current_cart
    before_action :check_for_cart
  
    def index
      @menu_items = MenuItem.all
      @line_items = current_order.line_items.build
      
    end
  
    def show
      @menu_item = MenuItem.find(params[:id])
      @line_items = current_order.line_items.build
    end
  
  
  
    
  end