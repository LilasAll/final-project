# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
  	content { "Un super commentaire pour tester" }
  	user { FactoryBot.create(:user) }
  	event { FactoryBot.create(:event) }
  end
end
