class ServiceListsController < ApplicationController
  def index
    @service_orders = ServiceOrder.all.order("created_at DESC")
    @service_orders = ServiceOrder.page(params[:page]).per(10).order("created_at DESC")
  end
end
