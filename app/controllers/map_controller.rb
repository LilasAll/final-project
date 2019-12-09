class MapController < ApplicationController
	def index
	gon.cities = City.all
	end
end
