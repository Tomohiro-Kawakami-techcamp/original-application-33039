class AdminController < ApplicationController
  before_action :authenticate_user!,  only: [:index, :show]
  before_action :move_to_root_path, only: [:index, :show]

  def index
    @users = User.all.order("created_at DESC")
    @users = User.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @orders = Order.all.order("created_at DESC")
    @orders = Order.page(params[:page]).per(10).order("created_at DESC")
  end

  private
  def move_to_root_path
    unless current_user.id == 1
      redirect_to root_path
    end
  end
end