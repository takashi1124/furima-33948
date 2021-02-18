class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :item_prefecture_id, :postal_code, :address, :city, :building, :phone_number, :order_id, :token

  validates :item_prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :address
    validates :city
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create(item_prefecture_id: item_prefecture_id, postal_code: postal_code, address: address, city: city, 
      building: building, phone_number: phone_number, order_id: order.id)
  end
end
