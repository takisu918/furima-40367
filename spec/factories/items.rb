FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 40) }
    description { Faker::Lorem.characters(number: 1000) }
    category_id { Faker::Number.between(from: 2, to: 12) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_payer_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    days_until_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.image.jpg'), filename: 'test.image.jpg')
    end
  end
end
