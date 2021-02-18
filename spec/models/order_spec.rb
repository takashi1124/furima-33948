require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.create(:order)
  end
  it 'user_idとitem_idがあると登録できる' do
    expect(@order).to be_valid
  end
end
