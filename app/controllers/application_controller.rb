class ApplicationController < ActionController::Base
    include ApplicationHelper
    include OrdersHelper
    before_action :check_for_cart
    
    

    

    
            


    def check_for_cart
        if current_user == nil
            
        else
            @current_cart = Cart.find_by(user_id: current_user.id)
        end
    end
    
    



    
end
