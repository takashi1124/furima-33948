class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.requier(:item).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date)
  end
end
