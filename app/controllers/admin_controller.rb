class AdminController < ApplicationController
  def index
    @users = User.all.order("created_at DESC")
  end

  def show
    @orders = Order.all.order("created_at DESC")
  end
end