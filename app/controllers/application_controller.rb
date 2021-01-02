class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :check_for_cart
    
    def current_cart
        if user_signed_in?
          if Cart.find_by(user_id: current_user.id) == nil
            id = SecureRandom.hex(8)
            @current_cart = Cart.create(
                :user_id => current_user.id,
                
            )
            @current_cart.save
          else 
            @current_cart = Cart.find_by(user_id: current_user.id)
          end
        else
          id = SecureRandom.hex(8) + "bb"
          # carts with user_ids that end in "bb" are guest carts
          @current_cart = Cart.create(user_id: id)
        end
    end

    

    def current_order
        @order = Order.cart_orders(current_cart.id).last
        if @order == nil
            current_order = Order.create(cart_id: current_cart.id, datetime: Time.now)
        else
            if @order.order_status == false
                current_order = Order.create(cart_id: current_cart.id, datetime: Time.now)
            else
                @current_order = @order
                
            end 
        end
    end
            


    def check_for_cart
        if current_user == nil
            
        else
            @current_cart = Cart.find_by(user_id: current_user.id)
        end
    end
    
    



    
end
