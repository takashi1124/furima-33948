require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '新規商品出品ができる' do
      it '必須項目が全て正しく存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '販売価格が300〜9,999,999であれば出品できる' do
        expect(@item).to be_valid
      end
      it '販売価格が半角数字で入力されていれば出品できる' do
        @item.price = '111111'
        expect(@item).to be_valid
      end
    end
    context '新規商品出品ができない' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態を選択しないと出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status must be other than 1")
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture must be other than 1")
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角数字では出品できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
