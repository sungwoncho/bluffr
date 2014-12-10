# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    date { Date.today }
    home_team { Faker::Lorem.word }
    home_team_score [1,2,3].sample
    away_team { Faker::Lorem.word }
    away_team_score [1,2,3,4].sample
  end
end
