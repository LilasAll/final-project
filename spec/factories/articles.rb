# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.paragraph_by_chars(number: 10, supplemental: false) }
    content { Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false) }
    author { FactoryBot.create(:user) }
    resume { "Un super résumé d'article youhou"}
  end
end
