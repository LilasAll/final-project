class MapController < ApplicationController
	def index
	gon.cities = Place.all
	gon.cities_secondhand = Place.all.where(secondhand: true)
	
	end
end
