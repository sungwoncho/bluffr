# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password 'pass1234'
    password_confirmation 'pass1234'
  end
end
