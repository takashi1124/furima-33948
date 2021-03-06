class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item, only: [:index, :create, :reject]
  before_action :reject, only: :index

  def index
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:item_prefecture_id, :postal_code, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def reject
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end
end
