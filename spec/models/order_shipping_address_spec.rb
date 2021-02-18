require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      sleep 1
    end
    context '商品の購入ができる' do
      it '必要な情報が全て入力されている' do
        expect(@order_shipping_address).to be_valid
      end
      it '建物名は空でも登録できる' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end
    context '商品の購入ができない' do
      it '郵便番号が入力されていない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Postal code can't be blank")
      end
      it '郵便番号に-がない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Postal code is invalid")
      end
      it '都道府県が選択されていない' do
        @order_shipping_address.item_prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Item prefecture must be other than 1")
      end
      it '市区町村が入力されていない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("City can't be blank")
      end
      it '番地が入力されていない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Address can't be blank")
      end
      it '電話番号が入力されていない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Phone number can't be blank")
      end
      it '電話番号に-を入れて入力している' do
        @order_shipping_address.phone_number = '090-1234-5678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it '電話番号を12桁以上入力している' do
        @order_shipping_address.phone_number = '090123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'クレジットカード情報が入力されていない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include ("Token can't be blank")
      end
    end
  end
end
