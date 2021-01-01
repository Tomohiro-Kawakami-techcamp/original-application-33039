class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to  items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == 1
      @item.destroy
      redirect_to  items_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :delivery_id, :image, :price_discrimination).merge(user_id: current_user.id)
  end
end
