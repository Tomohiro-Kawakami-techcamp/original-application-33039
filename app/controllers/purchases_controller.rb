class PurchasesController < ApplicationController
  before_action :authenticate_user!,  only: [:show]

  def show
    @orders = Order.where(user_id: current_user.id).order("created_at DESC")
  end
end