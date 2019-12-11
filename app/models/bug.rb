# frozen_string_literal: true

class Bug < ApplicationRecord

	validates :content, presence: :true
	validates :user_name, presence: :true

end
