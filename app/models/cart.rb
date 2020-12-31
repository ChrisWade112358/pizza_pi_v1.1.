class Cart < ApplicationRecord
    belongs_to :user
    has_many :orders
    has_many :line_items, through: :orders






    def cart_params
        params.require(:cart).permit(
            :session_id, 
            :user_id,
            :order_id
        )
end
