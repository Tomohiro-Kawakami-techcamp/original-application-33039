class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: :edit

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to  items_path
    else
      render :edit
    end
  end

  def destroy
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

  def move_to_index
    unless current_user.id == 1
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end