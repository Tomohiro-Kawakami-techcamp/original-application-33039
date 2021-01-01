class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_donation = OrderDonation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      @order_donation.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

    private
  def donation_params
    params.require(:order_donation).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
