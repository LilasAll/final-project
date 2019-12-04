# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    description { Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false) }
    location { Faker::Movies::LordOfTheRings.location }
    title { Faker::Book.title }
    start_date { Faker::Date.forward(days: 250) }
    duration { rand(1..10) * 5 }
    creator { FactoryBot.create(:user) }
  end
end
