class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, inclusion: { in: 300..9999999 }
  validates :information, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 }
  validates :item_prefecture_id, numericality: { other_than: 1 }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
end
