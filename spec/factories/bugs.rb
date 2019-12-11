# frozen_string_literal: true

FactoryBot.define do
  factory :bug do
  	user_name { FactoryBot.create(:user).pseudo }
  	content { "Voici le contenu du bug." }
  end
end
