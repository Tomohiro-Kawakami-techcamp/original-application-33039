class AllappointsController < ApplicationController
  def index
    @service_orders = ServiceOrder.where(user_id: current_user.id).order("created_at DESC")
  end
end
