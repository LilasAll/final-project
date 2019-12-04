# frozen_string_literal: true

class Tag < ApplicationRecord

	has_many :join_tag_article	
	has_many :join_tag_event		
	has_many :articles, through: :join_tag_article
	has_many :events , through: :join_tag_event

	def all_tags=(names)

		self.tags = names.split(",").map do |name|

			Tag.where(name: name.strip).first_or_create!
			end
	end

	def all_tags
		self.tags.map(&:name).join(",")
	end

end
