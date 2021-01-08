class MenuItem < ApplicationRecord
    has_many :line_items
    has_many :orders, through: :line_items 
    has_one :category
    accepts_nested_attributes_for :categories

    
end
