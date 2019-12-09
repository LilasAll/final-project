# frozen_string_literal: true

FactoryBot.define do
  factory :like do
  	user { FactoryBot.create(:user) }
  	article { FactoryBot.create(:article) }
  end
end
