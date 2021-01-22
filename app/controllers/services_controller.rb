class ServicesController < ApplicationController

  def index
    @services = Service.all.order("created_at DESC")
  end

  def new
     @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to  root_path
    else
      render :new
    end
  end

  def service_params
    params.require(:service).permit(:content, :limit_day, :target, :release_day).merge(user_id: current_user.id)
  end
end