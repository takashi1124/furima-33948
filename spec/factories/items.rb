FactoryBot.define do
  factory :item do
    name {Faker::Lorem.words}
    information {Faker::Lorem.sentence}
    price {Faker::Number.within(range: 300..9999999)}
    category_id {Faker::Number.within(range: 2..11)}
    state_id {Faker::Number.within(range: 2..7)}
    item_shipping_fee_status_id {Faker::Number.within(range: 2..3)}
    item_prefecture_id {Faker::Number.within(range: 2..48)}
    item_scheduled_delivery_id {Faker::Number.within(range: 2..4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
