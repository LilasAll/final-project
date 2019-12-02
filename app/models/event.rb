class Event < ApplicationRecord

	has_many :users, through: :attendances
	has_many :attendances

end
