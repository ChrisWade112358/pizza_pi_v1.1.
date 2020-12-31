class Cart < ApplicationRecord
    belongs_to :user
    has_many :orders
    has_many :line_items, through: :orders
end
