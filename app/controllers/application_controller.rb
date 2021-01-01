class ApplicationController < ActionController::Base
    before_action :check_for_cart
    
    def current_cart
        if user_signed_in?
          if Cart.find_by(user_id: current_user.id) == nil
            id = SecureRandom.hex(8)
            @current_cart = Cart.create(
                :user_id => current_user.id,
                :order_id => id 
            )
            @current_cart.save
          else 
            @current_cart = Cart.find_by(user_id: current_user.id)
          end
        else
          id = SecureRandom.hex(8)
          @current_cart = Cart.create(order_id: id)
        end
    end

    def current_order
        if order_id == nil
            


    def check_for_cart
        if current_user == nil
            
        else
            @current_cart = Cart.find_by(user_id: current_user.id)
        end
    end
    
    



    
end
