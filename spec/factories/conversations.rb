# frozen_string_literal: true

FactoryBot.define do
  factory :conversation do
    sender_id { FactoryBot.create(:user).id }
    recipient_id { FactoryBot.create(:user).id }
  end
end
