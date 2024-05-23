FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    first_name { '山田' }
    last_name { '太郎' }
    reading_first_name { 'タナカ' }  # ここで適切なカタカナの生成方法を書いてみてください。
    reading_last_name { 'タロウ' }   # ここで適切なカタカナの生成方法を書いてみてください。
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) } 
  end
end