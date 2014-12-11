# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Match.destroy_all
Bluff.destroy_all
User.destroy_all

10.times do
  Match.create(
    date: Faker::Date.between(1.month.ago, 1.day.ago),
    home_team: Faker::Lorem.word,
    home_team_score: [1,2,3].sample,
    away_team: Faker::Lorem.word,
    away_team_score: [1,2,3].sample
  )
end

puts "Created #{Match.count} matches."

10.times do |n|
  User.create(
    username: "user_#{n}",
    email: "user_#{n}@example.com",
    password: 'pass1234'
  )
end

puts "Created #{User.count} users."

Match.all.each do |match|
  12.times do
    match.bluffs.create(
      statement_1: Faker::Lorem.sentence,
      statement_2: Faker::Lorem.sentence,
      user_id: (1..10).to_a.sample
    )
  end
end

puts "Created #{Bluff.count} bluffs."

