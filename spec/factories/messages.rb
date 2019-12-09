# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { 'MyText' }
    conversation { nil }
    user { nil }
  end
end
