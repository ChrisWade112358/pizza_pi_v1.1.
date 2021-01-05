class SubmissionsController < ApplicationController
  before_action :current_order
  def index
    current_order.order_status = false
    current_order.save
    binding.pry
  end

  
end
