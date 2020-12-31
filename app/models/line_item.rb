class LineItem < ApplicationRecord
    belongs_to :order
    has_many :menu_items
end
