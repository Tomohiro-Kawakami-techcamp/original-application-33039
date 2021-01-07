class ServiceOrdersController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
  end

  def create
    @service = Service.find(params[:service_id])
    @service_order = ServiceOrder.create(user_id: current_user.id, service_id: params[:service_id])
    if @service_order.save
      redirect_to  services_path
    else
      render :index
    end
  end
end
