# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { "Texte du message" }
    conversation { FactoryBot.create(:conversation) }
    user { FactoryBot.create(:user) }
  end
end
