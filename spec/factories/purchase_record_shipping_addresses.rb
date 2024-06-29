FactoryBot.define do
  factory :purchase_record_shipping_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0120345678' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end