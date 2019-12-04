# frozen_string_literal: true

class Tag < ApplicationRecord

	has_many :join_tag_articles	
	has_many :articles, through: :join_tag_articles

	has_many :join_tag_events		
	has_many :events , through: :join_tag_events



end
