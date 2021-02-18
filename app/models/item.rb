class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price, numericality: {:greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
    validates :information
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
end
