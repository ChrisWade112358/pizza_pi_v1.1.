class LineItem < ApplicationRecord
    belongs_to :order
    has_many :menu_items

    before_save :set_total


    def total
        menu_item.price * quantity
    end


    private

    def set_total
        self[:line_item_subtotal] = total * quantity
    end
end
