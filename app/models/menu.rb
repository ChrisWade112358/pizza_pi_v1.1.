class Menu < ApplicationRecord

    def current_cart
        if current_user?
          @current_cart = Cart.find_by(user_id: current_user.id)
        else
          id = SecureRandom.hex(8)
          @current_cart = Cart.create(session_id: id)
        end
      end

end