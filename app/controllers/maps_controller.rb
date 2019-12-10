class MapsController < ApplicationController
	def index
	gon.cities = Place.all
	gon.cities_secondhand = Place.all.where(secondhand: true)
	gon.cities_cultural = Place.all.where(cultural: true)
	gon.cities_garden = Place.all.where(garden: true)
	end
end
