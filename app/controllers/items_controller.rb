class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.created_at
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, :information, :state_id, :item_prefecture_id, :item_shipping_fee_status_id, :item_scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
end
