FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    reading_first_name { 'タナカ' }  
    reading_last_name { 'タロウ' }   
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) } 
  end
end