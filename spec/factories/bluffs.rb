# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bluff do
    statement_1 { Faker::Lorem.sentence }
    statement_2 { Faker::Lorem.sentence }
    association :match
    end
end
