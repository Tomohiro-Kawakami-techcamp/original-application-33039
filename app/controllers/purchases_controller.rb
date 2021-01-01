class PurchasesController < ApplicationController
  def index
    @orders = Orders.all
  end

  def show
    @orders = Order.where(user_id: current_user.id)
  end
end