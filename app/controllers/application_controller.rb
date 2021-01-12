class ApplicationController < ActionController::Base
    include ApplicationHelper
    include OrdersHelper
    include LineItemsHelper
    
    
    
    
            


    def check_for_cart
       if current_user == nil
            redirect_to root_path, alert: "Please sign in to continue to menu."
       else
            @current_cart = Cart.find_by(user_id: current_user.id)
       end
    end
    
end
