class SubmissionsController < ApplicationController
  before_action :current_order
  def index
    current_order.update(order_status: false)
    current_order.save
  end
end
