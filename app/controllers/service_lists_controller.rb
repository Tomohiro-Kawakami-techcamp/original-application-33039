class ServiceListsController < ApplicationController
  def index
    @service_orders = ServiceOrder.all.order("created_at DESC")
  end
end
