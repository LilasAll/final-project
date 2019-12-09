# frozen_string_literal: true

class Bug < ApplicationRecord

	validates :content, presence: :true

end
