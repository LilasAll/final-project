# frozen_string_literal: true

class Tag < ApplicationRecord

	has_many :join_tag_articles	
	has_many :articles, through: :join_tag_articles

	has_many :join_tag_events		
	has_many :events , through: :join_tag_events


	def all_tags=(names)

		self.tags = names.split(",").map do |name|

			Tag.where(name: name.strip).first_or_create!
			end
	end

	def all_tags
		self.tags.map(&:name).join(",")
	end

end
