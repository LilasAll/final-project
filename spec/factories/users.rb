FactoryBot.define do
  factory :user do
		email { "user#{rand(1..1000)}@yopmail.com" }
		pseudo { "pseudo#{rand(1..100000)}" }
		city { Faker::Address.city }
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		is_admin { false }
		password { "1234567" }
  end
end
