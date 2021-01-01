class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_cart
    binding.pry
    if current_user?
      @current_cart = Cart.find_by(user_id: curent_user.id)
    else
      @current_cart = Cart.create(session_id: id)
    end
  end

  


end
