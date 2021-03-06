FactoryBot.define do
  factory :order_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    item_prefecture_id {2}
    city {"横浜市"}
    address {"1-2-3"}
    building {"ハイツ横浜"}
    phone_number {"09012345678"}
  end
end
